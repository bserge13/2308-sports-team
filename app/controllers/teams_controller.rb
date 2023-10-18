class TeamsController < ApplicationController
  def index
    @teams = Team.desc_order 
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def edit 
    @team = Team.find(params[:id])
  end

  def create 
    team = Team.create(team_params) 
    redirect_to "/teams"
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      redirect_to "/teams/#{team.id}"
    end
  end

  def destroy 
    # Team.find(params[:id]).destroy 
    @team = Team.find(params[:id])
    @team.destroy 
    redirect_to "/teams"
  end

  private

  def team_params
    params.permit(:id, :team_name, :city, :number_of_titles, :expansion_team)
  end
end