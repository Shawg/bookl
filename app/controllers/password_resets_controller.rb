class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = UserAccount.find_by_email(params[:email])
  	if user
  		user.send_password_reset
      flash[:success] = "Email sent with password and instructions."
  		redirect_to root_url
  	else
      flash[:danger] = "User with email was not found."
  		render :new
  	end
  end

  def edit
  	@user = UserAccount.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = UserAccount.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
      flash[:danger] = "Password reset has expired"
  		redirect_to new_password_reset_path
  	elsif @user.update_attributes(params.permit![:user_account])
      flash[:success] = "Password has been reset"
  		redirect_to root_url
  	else
  		render :edit
  	end
  end
end
