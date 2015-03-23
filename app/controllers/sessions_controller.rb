class SessionsController < ApplicationController
  def new
  end

  def create
  	user_account = UserAccount.find_by(email: params[:session][:email].downcase)
  	if user_account && user_account.authenticate(params[:session][:password])
  		log_in user_account
  		redirect_to user_account	
  	else
  		flash.now[:danger] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_url	
  end
end
