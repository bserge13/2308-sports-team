require "rails_helper"

RSpec.describe "Features" do 
  describe "#show" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)
      @lakers = Team.create!(team_name: "Lakers", city: "Los Angeles", expansion_team: false, number_of_titles: 17)
      @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)
    end
    
    it "has a show page with a teams attributes" do 
      visit "/teams/#{@celtics.id}"
      
      expect(page).to have_content(@celtics.team_name)
      expect(page).to have_content(@celtics.city)
      expect(page).to have_content(@celtics.expansion_team)
      expect(page).to have_content(@celtics.number_of_titles)
    end
  end 
end 
