require "rails_helper"

RSpec.describe "Features" do 
  describe "#show" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)
      @lakers = Team.create!(team_name: "Lakers", city: "Los Angeles", expansion_team: false, number_of_titles: 17)
      @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)

      @jordan = Player.create!(player_name: "Michael Jordan", age: 23, hometown: "Willmington, NC", all_star: true, team_id: @bulls.id)
      @pippen = Player.create!(player_name: "Scotty Pippen", age: 22, hometown: "Hamburg, AK", all_star: true, team_id: @bulls.id)
      @rodman = Player.create!(player_name: "Dennis Rodman", age: 22, hometown: "Bronx, NY", all_star: true, team_id: @bulls.id)
      @kerr = Player.create!(player_name: "Steve Kerr", age: 32, hometown: "San Fransisco, CA", all_star: false, team_id: @bulls.id)
      @bird = Player.create!(player_name: "Larry Bird", age: 33, hometown: "French Lick, IN", all_star: true, team_id: @celtics.id)
    end
    
    it "has a show page with a teams attributes" do 
      visit "/teams/#{@bulls.id}"
      
      expect(page).to have_content("Name: #{@bulls.team_name}")
      expect(page).to have_content("Location: #{@bulls.city}")
      expect(page).to have_content("Number of Titles: #{@bulls.number_of_titles}")
      expect(page).to have_content("Expansion Team: #{@bulls.expansion_team}")
      expect(page).to have_content("Number of Players: #{@bulls.player_count}")
    end

    it "has a link to a teams index page" do 
      visit "/teams/#{@bulls.id}"

      expect(page).to have_link("All Teams") 
    end

    it "has a link to a teams players show page" do 
      visit "/teams/#{@bulls.id}"

      expect(page).to have_link("#{@bulls.team_name} Players") 
    end

    it "has a link to update a team" do 
      visit "/teams/#{@bulls.id}"

      expect(page).to have_link("Update Team")
    end

    it "routes a user to a page to edit a team" do 
      visit "/teams/#{@bulls.id}"

      click_link("Update Team")
      expect(page).to have_current_path("/teams/#{@bulls.id}/edit")
    end

    it "has a link to delete a team" do
      visit "/teams/#{@philly.id}"

      expect(page).to have_content("Delete #{@philly.team_name}")
    end

    it "deletes a team and redirects a user back to the teams index page" do 
      visit "/teams/#{@philly.id}"

      click_link("Delete #{@philly.team_name}")
      expect(page).to have_current_path("/teams")
      expect(page).to_not have_content(@philly.team_name) 
    end
  end 
end 
