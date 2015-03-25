class UserAccountsController < ApplicationController
  before_action :set_user_account, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy, :adminView]

  # GET /user_accounts
  # GET /user_accounts.json
  def index
    @user_accounts = UserAccount.all
  end

  # GET /user_accounts/1
  # GET /user_accounts/1.json
  def show ()

  end
 
  # GET /user_accounts/new
  def new
    @user_account = UserAccount.new
  end

  # GET /user_accounts/1/edit
  def edit
  end

  def adminView
    @user_accounts = UserAccount.all
    # @user_account = UserAccount.find(params[:id])
  end

  # POST /user_accounts
  # POST /user_accounts.json
  def create
    @user_account = UserAccount.new(user_account_params)

    respond_to do |format|
      if @user_account.save
        flash[:success] = "Welcome to Bookl!"
        log_in @user_account
        format.html { redirect_to @user_account }
        format.json { render :show, status: :created, location: @user_account }
      else
        format.html { render :new }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_accounts/1
  # PATCH/PUT /user_accounts/1.json
  def update
    respond_to do |format|
      if @user_account.update(user_account_params)
        format.html { redirect_to @user_account, notice: 'User account was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_account }
      else
        format.html { render :edit }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_accounts/1
  # DELETE /user_accounts/1.json
  def destroy
    @user_account.destroy
    respond_to do |format|
      format.html { redirect_to user_accounts_url, notice: 'User account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_account
      @user_account = UserAccount.find(params[:id])
    end

    def admin_user
      if current_user_account.nil? 
        redirect_to(root_url) 
      else
        redirect_to(root_url) unless current_user_account.isAdmin?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_account_params
      params.require(:user_account).permit(:email, :password, :password_confirmation, :isAdmin?)
    end
end
