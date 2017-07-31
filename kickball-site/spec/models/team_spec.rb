require "spec_helper"

RSpec.describe Team do
  describe '.new' do
    it 'should take name as an argument' do
      expect(Team.new('waddup')).to be_a(Team)
    end 
  end

  describe '.all' do
    it 'should turn every team in a Team object and return them as an array' do
      all_teams = Team.all
      expect(all_teams).to include(a_kind_of(Team))
    end
  end

  describe '#player' do
    it 'should return an array of players that belong to this team' do
      players_of_this_team = Team.new('Jetson Jets').player
      expect(players_of_this_team).to include(a_kind_of(Player))
    end
  end
end
