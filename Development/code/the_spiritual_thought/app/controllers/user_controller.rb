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
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
            if @user.save
            login_help
            erb :"/user/homepage"
            else
            redirect to "/user/signup"
        end
    end

    post "/user/login" do
        login_help
     end

     get '/user/logout' do
        session.clear
        redirect to '/'
     end

     helpers do

        def login_help
                @user = User.find_by(:email => params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                erb :"/user/homepage"
            else
                redirect to "/user/login"
            end

        end
     end
end