class TeamPlayersController < ApplicationController
  def index 
    @team = Team.find(params[:id])
    if params[:sort] == "asc" 
      @players = @team.alphabatize
    else 
      @players = @team.players 
    end 
  end

  def new
    @team = Team.find(params[:id]) 
  end

  def create 
    @team = Team.find(params[:id])
    @player = @team.players.create(player_params)
      redirect_to "/teams/#{@team.id}/players"
  end

  private 

  def player_params
    params.permit(:id, :player_name, :hometown, :age, :all_star, :team_id)
  end
end