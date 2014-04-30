class UsersController < ApplicationController
  def signup
  end

  def signup_complete
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    if params[:password] == params[:retype_password]
      user.password = params[:password]
      if user.save
         flash[:alert] = "Registered!"
         redirect_to "/"
       else
         flash[:alert] = user.errors.values.flatten.join(' ')
         redirect_to :back
       end
     else
       flash[:alert] = "Wrong password. Has to be more than 5 letters."
       redirect_to :back
     end
  end

  def login
  end

  def login_complete
     user = User.where(username: params[:username])[0]
     if user.nil?
       flash[:alert] = "Incorrect ID or Password. Please try again."
       redirect_to :back
      elsif user.password != params[:password]
        flash[:alert] = "Please check your password!"
        redirect_to :back
      else
        session[:user_id] = user.id
        flash[:alert] = "Welcome to my site, " + params[:username]
        redirect_to "/"
        end
  end

  def logout_complete
     reset_session
     flash[:alert] = "Logged out successfully!"
     redirect_to "/"
  end
end
