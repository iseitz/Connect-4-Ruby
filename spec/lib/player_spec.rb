require 'spec_helper'
# require_relative '../../lib/player'

describe Player do
  let(:player) { Player.new('x') }
  let(:o_player) { Player.new('o') }

  it 'has a x symbol when created' do
    expect(player.symbol).to eq('x')
  end

  it 'has an o symbol when created' do
    expect(o_player.symbol).to eq('o')
  end

  it 'creates an empty string for players name and saves it' do
    expect(player.name).to eq('')
  end
end
