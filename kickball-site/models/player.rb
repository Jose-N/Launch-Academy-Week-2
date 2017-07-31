require_relative "./team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all()
    all_players = []
    TeamData::ROLL_CALL.each do |team, extra|
      extra.each do |position, player_name|
        all_players << Player.new(player_name, position, team)
      end
    end
    all_players
  end
end
