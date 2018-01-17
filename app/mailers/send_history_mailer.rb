class SendHistoryMailer < ApplicationMailer
    add_template_helper ApplicationHelper
	def send_mailer(patient,email,asunto,descripcion,current_user_pdf)
        @account = Account.where(admin_user: current_user_pdf.admin_user).first
        @patient = patient
        history = ClinicHistory.find_by_id(@patient.clinic_histories.first.id)
        @clinic_history = ClinicHistory.find_by_id(@patient.clinic_histories.first.id)
        @descripcion = descripcion
        attachments['job.pdf'] =  WickedPdf.new.pdf_from_string(render_to_string(:pdf => 'history', :template => 'clinic_histories/pdfs/clinic_history_send.pdf.erb', layout: 'pdf.html.erb'))
        mail(to: email, subject: asunto)

    end
end



