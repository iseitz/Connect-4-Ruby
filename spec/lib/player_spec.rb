require 'spec_helper'
# require_relative '../../lib/player'

describe Player do

  it 'has a x symbol when created' do
    player = Player.new('x')
    expect(player.symbol).to eq('x')
  end

  it 'has an o symbol when created' do
    player = Player.new('y')
    expect(player.symbol).to eq('y')
  end

  it 'creates an empty string for players name and saves it' do
    player = Player.new('y')
    expect(player.name).to eq('')
  end
end
