require "spec_helper"

RSpec.describe Player do
  let(:player) {Player.new('jose', 'catcher', 'phillies')}

  describe "#new" do
    it 'should take a name, position, and team_name as arguments' do
      expect(player).to be_a(Player)
    end
  end

  describe '#name' do
    it 'should have a reader' do
      expect(player.name).to eq('jose')
    end
    it 'should not have a writer' do
      expect{player.name = 'party parrot'}.to raise_error(NoMethodError)
    end
  end
  
  describe '#position' do
    it 'should have a reader' do
      expect(player.position).to eq('catcher')
    end
    it 'should not have a writer' do
      expect{player.position = 'party parrot'}.to raise_error(NoMethodError)
    end
  end

  describe '#team_name' do
    it 'should have a reader' do
      expect(player.team_name).to eq('phillies')
    end
    it 'should not have a writer' do
      expect{player.team_name = 'party parrot'}.to raise_error(NoMethodError)
    end
  end

  describe '.all' do
    it 'should turn all players into player objects and return them as an array' do
      all_players = Player.all
      expect(all_players).to include(a_kind_of(Player))
    end
  end
end
