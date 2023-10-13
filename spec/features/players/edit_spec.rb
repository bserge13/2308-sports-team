require "rails_helper"

RSpec.describe "Features" do 
  describe "#edit" do 
    before :each do 
      @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)

      @iverson = Player.create!(player_name: "Allen Iverson", age: 28, hometown: "Hampton, VA", all_star: false, team_id: @philly.id)
    end 

    it "can edit a players information" do 
      visit "/players/#{@iverson.id}/edit"

      expect(page).to have_content("Edit #{@iverson.player_name}")
      expect(page).to have_field("Player Name")
      expect(page).to have_field("Age")
      expect(page).to have_field("Hometown")
      expect(page).to have_field("All-Star")
      expect(page).to have_button("Update Player")
    end 

    it "updates a player and redirects back to their show page with updated information" do
      visit "/players/#{@iverson.id}/edit"

      fill_in "Player Name", with: "Lucas Kleeman"
      fill_in "Age", with: 27 
      fill_in "Hometown", with: "Tell City, IN"
      check "All-Star"
      click_button "Update Player"
      expect(page).to have_current_path("/players/#{@iverson.id}")

      expect(page).to have_content("Name: Lucas Kleeman")
      expect(page).to have_content("Age: 27")
      expect(page).to have_content("Hometown: Tell City, IN")
      expect(page).to have_content("All-Star: true")
      expect(page).to_not have_content(@iverson.player_name)
    end
  end
end