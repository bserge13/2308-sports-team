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
    team = Team.new(team_params) 
    if team.save 
      redirect_to "/teams"
    end 
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      redirect_to "/teams/#{team.id}"
    end
  end

  private

  def team_params
    params.permit(:id, :team_name, :city, :number_of_titles, :expansion_team)
  end
end