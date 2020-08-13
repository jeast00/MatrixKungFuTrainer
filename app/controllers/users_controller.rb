class UsersController < ApplicationController

  get '/registrations/signup' do
    erb :'registrations/signup'
  end

  post '/registrations' do
    @user = User.new(params)
    @user.save
    session[:user_id] = @user.id
    erb :'users/homepage'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/homepage'
    end
    redirect '/sessions/login'
  end


  get '/users/homepage' do
    @user = User.find(session[:user_id])
    erb :'users/homepage'
  end

end
