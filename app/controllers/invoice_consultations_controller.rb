class InvoiceConsultationsController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update_invoice  , :destroy]
  before_action :set_cita, only: [:new]
  def index

  end

  def create
    @invoice_consultation = InvoiceConsultation.create(invoice_params)
    respond_to do |format|
      if @invoice_consultation.save
        format.html { redirect_to root_path }
        format.js
      else
        format.html { render :new }
      end
    end
    
  end


  def new
    respond_to do |format|
        format.js
    end

  end

  def edit
    respond_to do |format|
        format.js
    end
  end

  def show

  end

  def update_invoice
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.js
      else
        format.html { render :new }
      end
    end

  end

  def destroy

    respond_to do |format|
      if @invoice.destroy
          format.js
        else
          format.html { render :new }
      end
    end
    
  end


  private


  def set_invoice
    @invoice = InvoiceConsultation.find(params[:id])
  end

  def set_cita
    @cita = Appointment.find(params[:appointment_id])
  end

  def invoice_params
    params.permit(:invoice_date, :invoice_number, :consultation_value, :discount_value, :total_value, :comment, :appointment_id)
  end

end
