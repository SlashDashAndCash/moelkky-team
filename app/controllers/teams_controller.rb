class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @players = Player.all
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
    @players = Player.all
  end

  def update
    @team = Team.find(params[:id])
    @players = Player.all

    @players.each do |player|
      if member?(player)
        unless params[:team][:members].include?(player.id.to_s)
          debar(player)
        end
      else
        if params[:team][:members].include?(player.id.to_s)
          admit(player)
        end
      end
    end

    if @team.update(team_params)
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  def admit(player)
    @team.players << player
  end

  def debar(player)
    @team.players.delete(player)
  end

  def member?(player)
    @team.players.include?(player)
  end

  private
    def team_params
      params.require(:team).permit(:name, :members)
    end
end
