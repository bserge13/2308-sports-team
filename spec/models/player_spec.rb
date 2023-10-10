require "rails_helper"

RSpec.describe Player, type: :model do 

  describe "relationships" do 
    it { should belong_to :team }
  end

  describe "validations" do 
    it { should validate_presence_of :player_name }
    it { should validate_presence_of :hometown }
    it { should validate_numericality_of :age }
    it { should allow_value(true).for(:all_star) }
    it { should allow_value(false).for(:all_star) }
  end
end