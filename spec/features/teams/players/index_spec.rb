require "rails_helper"

RSpec.describe "Features" do 
  describe "#parent_child_index" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)

      @jordan = Player.create!(player_name: "Michael Jordan", age: 23, hometown: "Willmington, NC", all_star: true, team_id: @bulls.id)
      @pippen = Player.create!(player_name: "Scotty Pippen", age: 22, hometown: "Hamburg, AK", all_star: true, team_id: @bulls.id)
      @rodman = Player.create!(player_name: "Dennis Rodman", age: 22, hometown: "Bronx, NY", all_star: true, team_id: @bulls.id)
      @kerr = Player.create!(player_name: "Steve Kerr", age: 32, hometown: "San Fransisco, CA", all_star: false, team_id: @bulls.id)
      @bird = Player.create!(player_name: "Larry Bird", age: 33, hometown: "French Lick, IN", all_star: true, team_id: @celtics.id)
    end

    it "Shows all the players on a given team" do 
      visit "/teams/#{@bulls.id}/players"

      expect(page).to have_content(@bulls.team_name)
      expect(page).to have_content(@bulls.city)

      expect(page).to have_content(@jordan.player_name)
      expect(page).to have_content(@jordan.age)
      expect(page).to have_content(@jordan.hometown)
      expect(page).to have_content(@jordan.all_star)

      expect(page).to have_content(@pippen.player_name)
      expect(page).to have_content(@pippen.age)
      expect(page).to have_content(@pippen.hometown)
      expect(page).to have_content(@pippen.all_star)
      
      expect(page).to have_content(@rodman.player_name)
      expect(page).to have_content(@rodman.age)
      expect(page).to have_content(@rodman.hometown)
      expect(page).to have_content(@rodman.all_star)

      expect(page).to have_content(@kerr.player_name)
      expect(page).to have_content(@kerr.age)
      expect(page).to have_content(@kerr.hometown)
      expect(page).to have_content(@kerr.all_star)

      expect(page).to_not have_content(@bird.player_name)
    end

    it "has a link to a teams index page" do 
      visit "/teams/#{@bulls.id}/players"

      expect(page).to have_link("All Teams") 
    end

    it "has a link to add a new player to a team" do 
      visit "/teams/#{@bulls.id}/players"

      expect(page).to have_link("Create Player") 
    end

    it "routes to page with a form to create a new player" do 
      visit "/teams/#{@bulls.id}/players"

      click_link("Create Player")
      expect(page).to have_current_path("/teams/#{@bulls.id}/players/new")
    end
  end 
end 