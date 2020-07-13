class UserController < ApplicationController

    get '/user' do
        erb :"/user/index"
    end

    get '/user/signup' do
        erb :"/user/signup"
    end

    get '/user/login' do
        erb :"/user/login"
    end

    get '/user/homepage' do
        @user = User.find_by_id(session[:user_id])
        erb :"/user/homepage"
    end

    post '/user/signup' do
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
   
    erb :"/user/login"
    end

    post "/user/login" do
        @user = User.find_by(:email => params[:email])
       if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @session = session
        erb :"/user/homepage"
       end
     end

     get '/user/logout' do
        session.clear
        redirect to '/'
     end
end