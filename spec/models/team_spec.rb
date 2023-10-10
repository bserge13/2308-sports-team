require "rails_helper"

RSpec.describe Team, type: :model do 
  
  describe "relationships" do 
    it { should have_many :players }
  end

  describe "validations" do 
    it { should validate_presence_of :team_name }
    it { should validate_presence_of :city }
    it { should validate_numericality_of :number_of_titles }
    it { should allow_value(true).for(:expansion_team) }
    it { should allow_value(false).for(:expansion_team) }
  end
end