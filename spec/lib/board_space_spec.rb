require 'spec_helper'

describe BoardSpace do
  let(:space) { BoardSpace.new }
  let (:player) { Player.new('x') }

   it 'is occupied if a player has played there' do
     space.player = player
     expect(space).to be_occupied
   end

   it 'is not occupied if a player has not played there' do
     expect(space).to_not be_occupied
   end

   it 'has a player if one is assigned to it' do
     space.player = player
     expect(space.player).to eq(player)
   end

   it 'represents the player occupying it as a string' do
     space.player = player
     expect(space.to_char).to eq('x')
   end

   it 'represents an empty string space if it is empty' do
     expect(space.to_char).to eq(' ')
   end

end
