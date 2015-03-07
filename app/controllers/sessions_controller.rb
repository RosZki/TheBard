class SessionsController < ApplicationController
	skip_before_action :require_login, except: :logout
	
def login_page
	if session[:user_id]
		redirect_to :root
	end
end

def login
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		session[:name] = user.name
		redirect_to :root
	else
		redirect_to action: :login_page
	end
end

def signup_page
end

def signup
	user = User.create_user(params[:name], params[:username], params[:password], params[:password_confirm])
	if user
		redirect_to action: :login_page
	else
		redirect_to action: :signup_page
	end
end

def logout
	session[:user_id] = nil
	redirect_to action: :login_page
end	
	
end
