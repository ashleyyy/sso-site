require 'jwt'
require 'dotenv'
Dotenv.load

SHARED_SECRET = ENV['SHARED_SECRET']
THINKIFIC_SUBDOMAIN = ENV['THINKIFIC_SUBDOMAIN']

def generate_payload
  iat = Time.now.to_i
  jti = "#{iat}/#{SecureRandom.hex(18)}"
  payload = JWT.encode({
    :iat   => iat,
    :jti   => jti,
    :first_name  => @user.first_name,
    :last_name => @user.last_name,
    :email => @user.email
    }, SHARED_SECRET
  )
  payload
end

def thinkific_sso_url(payload)
  url = "http://#{THINKIFIC_SUBDOMAIN}.thinkific.com/api/sso/v2/sso/jwt?jwt=#{payload}"
  # url = "http://#{THINKIFIC_SUBDOMAIN}.thinkific-staging.com/sso/jwt?jwt=#{payload}"
  # url += "&return_to=http://learning.compliance.world/courses/141724"
  # url += "&error_url=#{URI.escape(params["error_url"])}" unless params["error_url"].nil?
end