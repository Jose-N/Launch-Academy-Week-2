require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get '/teams' do
  @all_teams = Team.all
  erb :teams
end

get '/positions' do
  @positions = TeamData::ROLL_CALL.values[0].keys

  erb :positions
end

get '/:team_name' do
  @team_name = params[:team_name]
  @this_teams_players = Team.new(params[:team_name]).player
  erb :team_name
end

get '/positions/:position_name' do
  @position_name = params[:position_name]
  @players_of_position = []
  Player.all.each do |player|
    if player.position.to_s == @position_name
      @players_of_position << player
    end
  end

  erb :players_and_position
end
