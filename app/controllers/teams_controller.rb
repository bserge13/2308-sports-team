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
    else 
      flash[:error] = "Error: All fields must be filled in to create"
      redirect_to "/teams/new"
    end
  end

  private

  def team_params
    params.permit(:id, :team_name, :city, :number_of_titles, :expansion_team)
  end
end