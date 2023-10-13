class PlayersController < ApplicationController
  def index 
    @players = Player.all 
  end

  def show
    @player = Player.find(params[:id]) 
  end

  def edit 
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update(player_params)
      redirect_to "/players/#{player.id}"
    end
  end

  private 

  def player_params
    params.permit(:id, :player_name, :hometown, :age, :all_star)
  end

end