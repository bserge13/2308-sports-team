class Player < ApplicationRecord
  belongs_to :team 

  validates_presence_of :player_name, :hometown

  validates :all_star, inclusion: [true, false]
  
  validates_numericality_of :age
end