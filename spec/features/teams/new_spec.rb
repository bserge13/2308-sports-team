require "rails_helper"

RSpec.describe "Features" do 
  describe "#new" do 
    it "has a form to create a new team" do 
      visit "/teams/new"

      expect(page).to have_content("Create a Team")
      expect(page).to have_field("Team Name")
      expect(page).to have_field("City")
      expect(page).to have_field("Number of Titles")
      expect(page).to have_field("Expansion Team")
      expect(page).to have_button("Create Team")
    end

    it "creates a new team" do 
      visit "/teams/new"

      fill_in "Team Name", with: "Tropics"
      fill_in "City", with: "Flint"
      fill_in "Number of Titles", with: 1
      check "Expansion Team"
      click_button "Create Team"

      expect(page).to have_current_path("/teams")
      expect(page).to have_content("Flint Tropics")
    end
  end
end