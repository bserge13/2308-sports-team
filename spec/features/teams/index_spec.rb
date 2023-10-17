require "rails_helper"

RSpec.describe "Features" do 
  describe "#index" do 
    before :each do 
      @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)
      @celtics = Team.create!(team_name: "Celtics", city: "Boston", expansion_team: false, number_of_titles: 17)
      @lakers = Team.create!(team_name: "Lakers", city: "Los Angeles", expansion_team: false, number_of_titles: 17)
      @philly = Team.create!(team_name: "76ers", city: "Philadelphia", expansion_team: true, number_of_titles: 3)
    end
  
    it "has an index of teams" do 
      visit "/teams"

      expect(page).to have_content(@bulls.team_name)
      expect(page).to have_content(@bulls.city)

      expect(page).to have_content(@celtics.team_name)
      expect(page).to have_content(@celtics.city)

      expect(page).to have_content(@lakers.team_name)
      expect(page).to have_content(@lakers.city)

      expect(page).to have_content(@philly.team_name)
      expect(page).to have_content(@philly.city)
    end

    it "has a link to create a new team" do 
      visit "/teams"

      expect(page).to have_link("New Team")
    end

    it "routes a user to page to create a new team" do 
      visit "/teams"
  
      click_link("New Team")
      expect(page).to have_current_path("/teams/new")
    end

    it "has a button to update a team" do 
      visit "/teams"

      expect(page).to have_link("Update #{@bulls.team_name}")
      expect(page).to have_link("Update #{@celtics.team_name}")
      expect(page).to have_link("Update #{@lakers.team_name}")
      expect(page).to have_link("Update #{@philly.team_name}")
    end

    it "redirects a user to a teams edit page" do 
      visit "/teams"

      click_link("Update #{@bulls.team_name}")
      expect(page).to have_current_path("/teams/#{@bulls.id}/edit")
    end

    it "has a link next to teams to delete from the index page" do 
      visit "/teams"

      expect(page).to have_content("Delete #{@bulls.team_name}") 
      expect(page).to have_content("Delete #{@celtics.team_name}") 
      expect(page).to have_content("Delete #{@lakers.team_name}") 
      expect(page).to have_content("Delete #{@philly.team_name}") 
    end  

    it "deletes a team from the index page" do 
      visit "/teams"

      click_link("Delete #{@lakers.team_name}")
      expect(page).to have_current_path("/teams")

      expect(page).to_not have_content(@lakers.team_name)
    end
  end 
end 