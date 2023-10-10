class Team < ApplicationRecord
  has_many :players 

  validates_presence_of :team_name, :city
  # validates_presence_of :expansion_team

  validates_numericality_of :number_of_titles

  def self.desc_order
    all.order(created_at: :desc) 
  end

  def player_count
    players.count
  end
end