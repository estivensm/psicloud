class LegalDocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_legal_document, only: [:show, :edit, :update, :destroy]
  layout 'admin_patient'

  # GET /legal_documents
  # GET /legal_documents.json
  def index
    @legal_documents = LegalDocument.where(admin_user: current_user.admin_user)
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /legal_documents/1
  # GET /legal_documents/1.json
  def show
  end

  # GET /legal_documents/new
  def new
    @legal_document = LegalDocument.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /legal_documents/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /legal_documents
  # POST /legal_documents.json
  def create
    @legal_document = LegalDocument.new(legal_document_params)

    respond_to do |format|
      if @legal_document.save
        format.html { redirect_to patient_clinic_history_legal_documents_path(params[:patient_id],params[:clinic_history_id]), notice: 'Legal document was successfully created.' }
        format.json { render :show, status: :created, location: @legal_document }
      else
        format.html { render :new }
        format.json { render json: @legal_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_documents/1
  # PATCH/PUT /legal_documents/1.json
  def update
    respond_to do |format|
      if @legal_document.update(legal_document_params)
        format.html { redirect_to patient_clinic_history_legal_documents_path(params[:patient_id],params[:clinic_history_id]), notice: 'Legal document was successfully updated.' }
        format.json { render :show, status: :ok, location: @legal_document }
      else
        format.html { render :edit }
        format.json { render json: @legal_document.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /legal_documents/1
  # DELETE /legal_documents/1.json
  def destroy
    @legal_document.destroy
    respond_to do |format|
      format.html { redirect_to patient_clinic_history_legal_documents_path(params[:patient_id],params[:clinic_history_id]), notice: 'Legal document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_document
      @legal_document = LegalDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_document_params
      params.require(:legal_document).permit(:name, :description, :type_document, :user_id, :admin_user, :clinic_history_id, :patient_id,general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
