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

  describe "class methods" do 
    describe "#desc_order" do 
      it "lists teams in descending order by most recently created" do 
        @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
        @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)
        @lakers = Team.create!(team_name: "Lakers", city: "Los Angeles", expansion_team: false, number_of_titles: 17)
        @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)
  
        expect(Team.desc_order).to eq([@philly, @lakers, @celtics, @bulls])
      end
    end
  end
end