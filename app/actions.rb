# frozen_string_literal: true

require 'sinatra/flash'
require_relative 'payload'

enable :sessions

helpers do
  def logged_in?
    session[:user_id].present?
  end

  def user
    User.find_by_id(session[:user_id])
  end

  attr_reader :current_user
end

# Homepage (Root path)
get '/' do
  @return_to = params['return_to']
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.password = params[:password]

  if @user.save
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id
    redirect thinkific_sso_url
  else
    erb :index
  end
end

before '/users/:id' do
  redirect '/' unless logged_in?
end

get '/users/:id' do
  @show_user = User.find(params[:id])
  erb(:"/users/show")
end

post '/login' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect thinkific_sso_url
  else
    flash[:notice] = "Sorry, your credentials weren't recognized!"
    redirect '/'
  end
end

get '/home' do
  erb :home
end

get '/logout' do
  session[:user_id] = nil
  redirect "https://#{THINKIFIC_SUBDOMAIN}.thinkific.com/users/sign_out"
end

#
# get '/posts' do
#
#     #show all posts
#     @posts = Post.all()
#     erb(:"/posts/show")
#
# end
#
# get '/posts/:id' do
#
#     #show single post by id
#     @show_post = Post.find(params[:id])
#     erb(:"/posts/show")
#
# end
#
# get '/posts/new' do
#
#     #create a new post
#     erb(:"/posts/new")
#
# end
#
# get '/posts/:id/edit' do
#
#     #show edit for for a post by id
#     @edit_post = Post.find(params[:id])
#     erb(:"/posts/edit")
#
# end
#
# get '/posts/:id/delete' do
#
#     #delete a post by id
#     delete_post = Post.find(params[:id])
#     delete_post.destroy
#
# end
#
#
#
#
#
# post '/posts/:id/edit' do
#
#     #submit a post edit by id
#     post_to_edit = Post.find(params[:id])
#     #assign properties
#     post_to_edit.save
# end
#
# post '/posts/new' do
#     new_post = Post.new
#     #assign properties
#     new_post.save
#
# end
