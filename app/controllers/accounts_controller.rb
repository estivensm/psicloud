class AccountsController < ApplicationController
    before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
      @account_type= AccountType.all
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account_type= AccountType.all
  end

  # GET /accounts/1/edit
  def edit
    @account_type= AccountType.all
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account_type= AccountType.all
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    @account_type= AccountType.all
    respond_to do |format|
      if @account.update(account_params)
         if params[:remove_logo]
        @account.remove_logo!
        @account.save
      end
        format.html { redirect_to @account, notice: 'La Empresa fue editada exitosamente.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :address, :phone, :email, :logo, :nit,:admin_user,:account_type_id, :users_quantity, :file_size, :account_type, :remove_logo, :file_size_add,:users_quantity_add,:file_size_now,:users_quantity_now)
    end
end
