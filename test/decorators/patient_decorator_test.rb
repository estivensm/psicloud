require 'test_helper'

class PatientDecoratorTest < ActiveSupport::TestCase
  def setup
    @patient = Patient.new.extend PatientDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
