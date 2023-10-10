require "rails_helper"

RSpec.describe "Features" do 
  describe "#index" do 
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

    it "has an index of all players" do 
      visit "/players"

      expect(page).to have_content(@jordan.player_name)
      expect(page).to have_content(@jordan.age)
      expect(page).to have_content(@jordan.hometown)
      expect(page).to have_content(@jordan.all_star)

      expect(page).to have_content(@bird.player_name)
      expect(page).to have_content(@bird.age)
      expect(page).to have_content(@bird.hometown)
      expect(page).to have_content(@bird.all_star)

      expect(page).to have_content(@magic.player_name)
      expect(page).to have_content(@magic.age)
      expect(page).to have_content(@magic.hometown)
      expect(page).to have_content(@magic.all_star)

      expect(page).to have_content(@iverson.player_name)
      expect(page).to have_content(@iverson.age)
      expect(page).to have_content(@iverson.hometown)
      expect(page).to have_content(@iverson.all_star)
    end

    it "has a link to a teams index page" do 
      visit "/players"

      expect(page).to have_link("All Teams") 
    end
  end
end