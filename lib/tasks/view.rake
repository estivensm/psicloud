namespace :view do
  desc "Sends the most voted products created yesterday"
  task empresas: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        puts "Cuentas"
        puts Account.all.count
        puts "Usuarios"
        puts User.all.count
        puts "Pacientes"
        puts Patient.all.count
        puts "Historias Clinicas"
        puts ClinicHistory.all.count
        puts "Historia niño 1"
        puts ChildGeneralDate.all.count
        puts "Historia niño 2"
        puts PersonalHistory.all.count
        puts "Historia niño 3"
        puts TwoChildHistory.all.count
        puts "Historia niño 4"
        puts ThreeChildHistory.all.count
        puts "Acuerdos"
        puts Agreement.all.count
        puts "Eps"
        puts Hpc.all.count
        puts "Citas"
        puts Appointment.all.count
        puts "Antecendentes"
        puts Background.all.count
        puts "Antecendentes Personales"
        puts PersonalBackground.all.count
        puts "Hermanos"
        puts ChildBrother.all.count
        puts "Diagnosticos"
        puts Diagnostic.all.count
        puts "Herramientas"
        puts ToolTest.all.count
        puts "Seguimientos"
        puts Tracing.all.count
        
end
  end