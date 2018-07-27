class Field < ApplicationRecord
    belongs_to :user
    has_many :crete_fields, dependent: :destroy

end
