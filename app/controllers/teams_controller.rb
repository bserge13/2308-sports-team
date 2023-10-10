class TeamsController < ApplicationController
  def index
    @teams = Team.desc_order 
  end

  def show
    @team = Team.find(params[:id])
  end
end