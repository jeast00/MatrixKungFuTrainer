class UsersController < ApplicationController

  get '/registrations/signup' do
    erb :'registrations/signup'
  end

  post '/signup' do
    @user = User.create(params)
    erb :'/homepage'
  end

end
