require "rails_helper"

RSpec.describe "Features" do 
  describe "#parent_child_new" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @jordan = Player.create!(player_name: "Michael Jordan", age: 23, hometown: "Willmington, NC", all_star: true, team_id: @bulls.id)
    end 

    it "has a form to create a new player for a team" do 
      visit "/teams/#{@bulls.id}/players/new"

      expect(page).to have_content("Create a Player")
      expect(page).to have_field("Player Name")
      expect(page).to have_field("Age")
      expect(page).to have_field("Hometown")
      expect(page).to have_field("All-Star")
      expect(page).to have_button("Create Player")
    end

    it "creates a new player for a team" do 
      visit "/teams/#{@bulls.id}/players/new"

      fill_in "Player Name", with: "Joel Taylor"
      fill_in "Age", with: 18
      fill_in "Hometown", with: "Evansville, IN"
      check "All-Star"
      click_button "Create Player"

      expect(page).to have_current_path("/teams/#{@bulls.id}/players")

      expect(page).to have_content(@jordan.player_name)
      expect(page).to have_content(@jordan.age)
      expect(page).to have_content(@jordan.hometown)
      expect(page).to have_content(@jordan.all_star)

      expect(page).to have_content("Name: Joel Taylor")
      expect(page).to have_content("Age: 18")
      expect(page).to have_content("Hometown: Evansville, IN")
      expect(page).to have_content("All-Star: true")
    end
  end
end