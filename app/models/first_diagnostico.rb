# == Schema Information
#
# Table name: first_diagnosticos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  admin_user  :integer
#  user_id     :integer
#  count       :integer
#  codigo      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FirstDiagnostico < ApplicationRecord
	has_and_belongs_to_many :clinic_histories, dependent: :destroy
    has_and_belongs_to_many :clinic_history_couple_outcome, dependent: :destroy
   



     def self.import(file)
        spreadsheet = Roo::Spreadsheet.open(file.path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            diagnostico = find_by(id: row["id"]) || new
            diagnostico.attributes = row.to_hash
            diagnostico.save!
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
            when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
            when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
            when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end

end
