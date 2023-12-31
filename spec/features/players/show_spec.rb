require "rails_helper"

RSpec.describe "Features" do 
  describe "#show" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)
      @lakers = Team.create!(team_name: "Lakers", city: "Los Angeles", expansion_team: false, number_of_titles: 17)
      @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)

      @jordan = Player.create!(player_name: "Michael Jordan", age: 23, hometown: "Willmington, NC", all_star: true, team_id: @bulls.id)
      @bird = Player.create!(player_name: "Larry Bird", age: 33, hometown: "French Lick, IN", all_star: true, team_id: @celtics.id)
      @magic = Player.create!(player_name: "Irvin 'Magic' Johnson", age: 32, hometown: "Lansing, MI", all_star: true, team_id: @lakers.id)
      @iverson = Player.create!(player_name: "Allen Iverson", age: 28, hometown: "Hampton, VA", all_star: false, team_id: @philly.id)
    end

    it "has a show page with a players attributes" do 
      visit "/players/#{@iverson.id}"

      expect(page).to have_content(@iverson.player_name)
      expect(page).to have_content(@iverson.age)
      expect(page).to have_content(@iverson.hometown)
      expect(page).to have_content(@iverson.all_star)
    end

    it "has a link to a teams index page" do 
      visit "/players/#{@iverson.id}"

      expect(page).to have_link("All Teams") 
    end

    it "directs a user to the team index page" do 
      visit "/players/#{@iverson.id}"

      click_link("All Teams")
      expect(page).to have_current_path("/teams")
    end

    it "has a link to edit a player" do 
      visit "/players/#{@iverson.id}"

      expect(page).to have_link("Edit Player")
    end

    it "directs a user to an edit page when clicking the edit player link" do 
      visit "/players/#{@iverson.id}"

      click_link("Edit Player")
      expect(page).to have_current_path("/players/#{@iverson.id}/edit")
    end

    it "has a link to delete a player" do
      visit "/players/#{@magic.id}"

      expect(page).to have_content("Delete #{@magic.player_name}")
    end

    it "deletes a player and redirects a user back to the players index page" do 
      visit "/players/#{@magic.id}"
      
      click_link("Delete #{@magic.player_name}")
      expect(page).to have_current_path("/players")

      expect(page).to_not have_content(@magic.player_name) 
    end
  end 
end 
