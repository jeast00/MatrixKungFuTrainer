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

end
