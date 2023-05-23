# frozen_string_literal: true

SHARED_SECRET = ENV['SHARED_SECRET']
THINKIFIC_SUBDOMAIN = ENV['THINKIFIC_SUBDOMAIN']

def generate_payload(iat, jti)
  JWT.encode(
    {
      iat: iat,
      jti: jti,
      first_name: @user.first_name,
      last_name: @user.last_name,
      email: @user.email
    },
    SHARED_SECRET
  )
end

def thinkific_sso_url
  iat = Time.now.to_i
  jti = "#{iat}/#{SecureRandom.hex(18)}"
  payload = generate_payload(iat, jti)

  "http://#{THINKIFIC_SUBDOMAIN}.thinkific.com/api/sso/v2/sso/jwt?jwt=#{payload}&return_to=http://localhost:3000/"
end
