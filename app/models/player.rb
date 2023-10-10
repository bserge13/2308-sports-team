class Player < ApplicationRecord
  belongs_to :team 

  validates_presence_of :player_name, :hometown
  # validates_presence_of :all_star
  
  validates_numericality_of :age
end