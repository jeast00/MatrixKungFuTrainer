class SessionsController < ApplicationController

  get '/registrations/signup' do
    erb :'registrations/signup'
  end

  post '/registrations' do
    @user = User.create(params)
    # @user.save - if using User.new
    session[:user_id] = @user.id
    erb :'users/homepage'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'users/homepage'
    else
      erb :'sessions/login'
    end
  end

  get '/users/homepage' do
    @user = User.find(session[:user_id])
    erb :'users/homepage'
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
