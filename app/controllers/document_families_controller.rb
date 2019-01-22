class DocumentFamiliesController < ApplicationController
  before_action :set_document_family, only: [:show, :edit, :update, :destroy]
  before_action :set_history_family
  layout "admin_clinic_history_family"
  # GET /document_families
  # GET /document_families.json
  def index
    @document_families = DocumentFamily.where(document_type: "tool").where(clinic_history_family_id: @clinic_history_family.id).paginate(page: params[:page],:per_page => 10)
  end

  def diagnostic_documets
    @document_families = DocumentFamily.where(document_type: "diagnostic").where(clinic_history_family_id: @clinic_history_family.id).paginate(page: params[:page],:per_page => 10)
  end

  def legan_documents
    @document_families = DocumentFamily.where(document_type: "legal").where(clinic_history_family_id: @clinic_history_family.id).paginate(page: params[:page],:per_page => 10)
  end

  # GET /document_families/1
  # GET /document_families/1.json
  def show
  end

  # GET /document_families/new
  def new
    @document_family = DocumentFamily.new
  end

  # GET /document_families/1/edit
  def edit
  end

  # POST /document_families
  # POST /document_families.json
  def create
    @document_family = DocumentFamily.new(document_family_params)

  
      respond_to do |format|
        if @document_family.save
          format.html { 

            if @document_family.document_type == "diagnostic"       
              redirect_to clinic_history_family_diagnostic_documets_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            elsif @document_family.document_type == "legal" 
              redirect_to clinic_history_family_legan_documents_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            else
             redirect_to clinic_history_family_document_families_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            end  
          
          }
          format.json { render :show, status: :created, location: @document_family }
        else
          format.html { render :new }
          format.json { render json: @document_family.errors, status: :unprocessable_entity }
        end
      end      
    

  end

  # PATCH/PUT /document_families/1
  # PATCH/PUT /document_families/1.json
  def update

        respond_to do |format|
        if @document_family.update(document_family_params)
        format.html { 
             if @document_family.document_type == "diagnostic"       
              redirect_to clinic_history_family_diagnostic_documets_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            elsif @document_family.document_type == "legal" 
              redirect_to clinic_history_family_legan_documents_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            else
             redirect_to clinic_history_family_document_families_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            end
        }
        format.json { render :show, status: :ok, location: @document_family }
        else
        format.html { render :edit }
        format.json { render json: @document_family.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /document_families/1
  # DELETE /document_families/1.json
  def destroy
      @document_family.destroy
      respond_to do |format|
        format.html { 
            if @document_family.document_type == "diagnostic"       
              redirect_to clinic_history_family_diagnostic_documets_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            elsif @document_family.document_type == "legal" 
              redirect_to clinic_history_family_legan_documents_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            else
             redirect_to clinic_history_family_document_families_path(@clinic_history_family.id), notice: 'Document couple family was successfully created.' 
            end
        }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_family
      @document_family = DocumentFamily.find(params[:id])
    end

    def set_history_family
      @clinic_history_family = ClinicHistoryFamily.find(params[:clinic_history_family_id])
      @outcome_family = @clinic_history_family.outcome_families.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_family_params
      params.require(:document_family).permit(:tool_type, :descripcion, :document_type, :name, :string, :clinic_history_family_id, general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
