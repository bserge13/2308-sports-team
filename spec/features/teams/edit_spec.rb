require "rails_helper"

RSpec.describe "Features" do 
  describe "#edit" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: false, number_of_titles: 6)
    end
    it "has a form to update a teams information" do 
      visit "/teams/#{@bulls.id}/edit"
      
      expect(page).to have_content("Edit #{@bulls.city} #{@bulls.team_name}")
      expect(page).to have_field("Team Name")
      expect(page).to have_field("City")
      expect(page).to have_field("Number of Titles")
      expect(page).to have_field("Expansion Team")
      expect(page).to have_button("Update Team")
    end
    
    it "can update a teams information" do 
      visit "/teams/#{@bulls.id}/edit"

      fill_in "Team Name", with: "Aces"
      fill_in "City", with: "Evansville"
      fill_in "Number of Titles", with: 13
      check "Expansion Team"
      click_button "Update Team"
      expect(page).to have_current_path("/teams/#{@bulls.id}")

      expect(page).to have_content("Location: Evansville")
      expect(page).to have_content("Name: Aces")
      expect(page).to have_content("Number of Titles: 13")
      expect(page).to have_content("Expansion Team: true")
    end
  end
end