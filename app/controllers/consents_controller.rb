class ConsentsController < ApplicationController
  before_action :set_consent, only: [:show, :edit, :update, :destroy]

  # GET /consents
  # GET /consents.json
  def index
    @consents = Consent.all
  end

  # GET /consents/1
  # GET /consents/1.json
  def show
  end

  # GET /consents/new
  def new
    @consent = Consent.new
  end

  # GET /consents/1/edit
  def edit
  end

  # POST /consents
  # POST /consents.json
  def create
    @consent = Consent.new(consent_params)

    respond_to do |format|
      if @consent.save
        format.html { redirect_to consents_path, notice: 'Consent was successfully created.' }
        format.json { render :show, status: :created, location: @consent }
      else
        format.html { render :new }
        format.json { render json: @consent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consents/1
  # PATCH/PUT /consents/1.json
  def update
    respond_to do |format|
      if @consent.update(consent_params)
        format.html { redirect_to consents_path, notice: 'Consent was successfully updated.' }
        format.json { render :show, status: :ok, location: @consent }
      else
        format.html { render :edit }
        format.json { render json: @consent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consents/1
  # DELETE /consents/1.json
  def destroy
    @consent.destroy
    respond_to do |format|
      format.html { redirect_to consents_url, notice: 'Consent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consent
      @consent = Consent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consent_params
      params.require(:consent).permit(:user_id, :admin_user, :account_id, :body, :title, :first_age, :second_age,:header,:footer,:state)
    end
end
