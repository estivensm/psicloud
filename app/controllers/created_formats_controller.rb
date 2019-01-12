class CreatedFormatsController < ApplicationController
  before_action :set_created_format, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /created_formats
  # GET /created_formats.json
  def index
    @created_formats = CreatedFormat.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 20)

  end


  # GET /created_formats/1
  # GET /created_formats/1.json
  def show
    respond_to do |format|
      format.html 
      format.pdf do
        render :pdf => "Formato",
        :template => 'created_formats/pdf/formatos.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
          top: 15
                     },

        :show_as_html => params[:debug].present?
      end
    end
  end

  # GET /created_formats/new
  def new
    @created_format = CreatedFormat.new
  end

  # GET /created_formats/1/edit
  def edit
  end

  # POST /created_formats
  # POST /created_formats.json
  def create
    @created_format = CreatedFormat.new(created_format_params)

    respond_to do |format|
      if @created_format.save
        format.html { redirect_to created_formats_path, notice: 'Created format was successfully created.' }
        format.json { render :show, status: :created, location: @created_format }
      else
        format.html { render :new }
        format.json { render json: @created_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /created_formats/1
  # PATCH/PUT /created_formats/1.json
  def update
    respond_to do |format|
      if @created_format.update(created_format_params)
        format.html { redirect_to created_formats_path, notice: 'Created format was successfully updated.' }
        format.json { render :show, status: :ok, location: @created_format }
      else
        format.html { render :edit }
        format.json { render json: @created_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /created_formats/1
  # DELETE /created_formats/1.json
  def destroy
    @created_format.destroy
    respond_to do |format|
      format.html { redirect_to created_formats_url, notice: 'Created format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_created_format
      @created_format = CreatedFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def created_format_params
      params.require(:created_format).permit(:name, :description, :user_id, :admin_user, :format)
    end
end
