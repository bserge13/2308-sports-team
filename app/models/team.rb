class Team < ApplicationRecord
  has_many :players, dependent: :destroy  

  validates_presence_of :team_name, :city
  validates :expansion_team, inclusion: [true, false]

  validates_numericality_of :number_of_titles

  def self.desc_order
    all.order(created_at: :desc) 
  end

  def player_count
    players.count
  end

  def alphabatize 
    players.order("player_name")  
  end
end