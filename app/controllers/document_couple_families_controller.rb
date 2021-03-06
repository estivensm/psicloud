class DocumentCoupleFamiliesController < ApplicationController
  before_action :set_document_couple_family, only: [:show, :edit, :update, :destroy]
  before_action :set_clinic_history
  before_action :authenticate_user!
  layout "admin_clinic_history_couple"

  # GET /document_couple_families
  # GET /document_couple_families.json
  def index
    @document_couple_families = DocumentCoupleFamily.where(document_type: "tool").where(clinic_history_couple_id: @clinic_history_couple.id).paginate(page: params[:page],:per_page => 10)
  end

  def diagnostic_documets
    @document_couple_families = DocumentCoupleFamily.where(document_type: "diagnostic").where(clinic_history_couple_id: @clinic_history_couple.id).paginate(page: params[:page],:per_page => 10)
  end

  def legan_documents
    @document_couple_families = DocumentCoupleFamily.where(document_type: "legal").where(clinic_history_couple_id: @clinic_history_couple.id).paginate(page: params[:page],:per_page => 10)
  end

  # GET /document_couple_families/1
  # GET /document_couple_families/1.json
  def show
  end

  # GET /document_couple_families/new
  def new
    @document_couple_family = DocumentCoupleFamily.new
  end

  # GET /document_couple_families/1/edit
  def edit
  end
        #elsif params[:document_type] == "tool"
        #  format.html { redirect_to clinic_history_couple_document_couple_families_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' }
        #elsif params[:document_type] == "diagnostic"
        #  format.html { redirect_to clinic_history_couple_diagnostic_documets_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' }
        #elsif params[:document_type] == "legal"
        #  format.html { redirect_to clinic_history_couple_legan_documents_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' }

  # POST /document_couple_families
  # POST /document_couple_families.json
  def create
    @document_couple_family = DocumentCoupleFamily.new(document_couple_family_params)

    respond_to do |format|
      if @document_couple_family.save
        format.html { 
        
        if @document_couple_family.document_type == "diagnostic"       
          redirect_to clinic_history_couple_diagnostic_documets_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
        elsif @document_couple_family.document_type == "legal" 
          redirect_to clinic_history_couple_legan_documents_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
        else
         redirect_to clinic_history_couple_document_couple_families_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
        end  
          
        }
        format.json { render :show, status: :created, location: @document_couple_family }
      else
        format.html { render :new }
        format.json { render json: @document_couple_family.errors, status: :unprocessable_entity }
      end
    end
    

   
  end

  # PATCH/PUT /document_couple_families/1
  # PATCH/PUT /document_couple_families/1.json
  def update
      respond_to do |format|
        if @document_couple_family.update(document_couple_family_params)
          format.html {

            if @document_couple_family.document_type == "diagnostic"       
              redirect_to clinic_history_couple_diagnostic_documets_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            elsif @document_couple_family.document_type == "legal" 
              redirect_to clinic_history_couple_legan_documents_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            else
             redirect_to clinic_history_couple_document_couple_families_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            end  

           }
           
          format.json { render :show, status: :ok, location: @document_couple_family }
        else
          format.html { render :edit }
          format.json { render json: @document_couple_family.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /document_couple_families/1
  # DELETE /document_couple_families/1.json
  def destroy
      @document_couple_family.destroy
      respond_to do |format|
        format.html { 
            if @document_couple_family.document_type == "diagnostic"       
              redirect_to clinic_history_couple_diagnostic_documets_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            elsif @document_couple_family.document_type == "legal" 
              redirect_to clinic_history_couple_legan_documents_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            else
             redirect_to clinic_history_couple_document_couple_families_path(@clinic_history_couple.id), notice: 'Document couple family was successfully created.' 
            end
        }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_couple_family
      @document_couple_family = DocumentCoupleFamily.find(params[:id])
    end

    def set_clinic_history
      @clinic_history_couple = ClinicHistoryCouple.find(params[:clinic_history_couple_id])
      @clinic_history_couple_outcome = @clinic_history_couple.clinic_history_couple_outcome
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_couple_family_params
      params.require(:document_couple_family).permit(:tool_type, :descripcion, :document_type, :name, :clinic_history_couple_id,  general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
