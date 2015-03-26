module SessionsHelper
	def log_in(user_account)
		session[:user_account_id] = user_account.id
	end

	def log_out
		session.delete(:user_account_id)
		@current_user_account = nil
	end

	def current_user_account
		@current_user_account ||= UserAccount.find_by(id: session[:user_account_id])
	end

	def logged_in?
		!current_user_account.nil?
	end

	def admin
		if logged_in?
			UserAccount.find_by(id: session[:user_account_id]).isAdmin?
		end
	end
end
