class Player < ApplicationRecord
  belongs_to :team 

  validates_presence_of :player_name, :hometown
  validates :all_star, inclusion: [true, false]
  
  validates_numericality_of :age

  def only_all_star
    require 'pry'; binding.pry
  end
end