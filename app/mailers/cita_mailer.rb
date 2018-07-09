class CitaMailer < ApplicationMailer
    add_template_helper ApplicationHelper
	def programacion_cita(patient,appointment)
        @appointment = appointment
        @patient = patient
        mail(to: @patient.email, subject: "Programacion de Cita")
    end
end
