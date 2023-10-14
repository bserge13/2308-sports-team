require "rails_helper"

RSpec.describe Player, type: :model do 

  describe "relationships" do 
    it { should belong_to :team }
  end

  describe "validations" do 
    it { should validate_presence_of :player_name }
    it { should validate_presence_of :hometown }
    it { should validate_numericality_of :age }
    it { should allow_value(true).for(:all_star) }
    it { should allow_value(false).for(:all_star) }
  end

  describe "instance methods" do 
    describe "#only_true" do 
      it "returns only players whose all-star status is true" do

        @bulls = Team.create!(team_name: "Bulls", city: "Chicago", expansion_team: true, number_of_titles: 6)

        @jordan = Player.create!(player_name: "Michael Jordan", age: 23, hometown: "Willmington, NC", all_star: true, team_id: @bulls.id)
        @pippen = Player.create!(player_name: "Scotty Pippen", age: 22, hometown: "Hamburg, AK", all_star: true, team_id: @bulls.id)
        @rodman = Player.create!(player_name: "Dennis Rodman", age: 22, hometown: "Bronx, NY", all_star: true, team_id: @bulls.id)
        @kerr = Player.create!(player_name: "Steve Kerr", age: 32, hometown: "San Fransisco, CA", all_star: false, team_id: @bulls.id)
  
        
      end
    end
  end
end