require_relative "./team_data"

class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all()
    all_teams = []
    TeamData::ROLL_CALL.each do |team_name, extra|
      all_teams << Team.new(team_name)
    end
    return all_teams
  end

  def player
    players_of_this_team = []
    all_players = Player.all

    all_players.each do |player|
      if player.team_name.to_s == @name
        players_of_this_team << player
      end
    end
    return players_of_this_team
  end
end
