require './config/environment'

class ApplicationController < Sinatra::Base

  configure do   
    enable :sessions
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

   get "/" do
     redirect to "/user"
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