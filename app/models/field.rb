class Field < ApplicationRecord
    belongs_to :user
    has_many :crete_fields, dependent: :destroy
   	has_many :fieldselects , inverse_of: :field, dependent: :destroy
	accepts_nested_attributes_for :fieldselects, :allow_destroy => true

end
