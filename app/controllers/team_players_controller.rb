class TeamPlayersController < ApplicationController
  def index 
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:id]) 
  end

  def create 
    @team = Team.find(params[:id])
    @player = @team.players.new(player_params)

    if @player.save 
      redirect_to "/teams/#{@team.id}/players"
    end 
  end

  private 

  def player_params
    params.permit(:id, :player_name, :hometown, :age, :all_star, :team_id)
  end
end