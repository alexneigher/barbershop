require 'spec_helper'

RSpec.describe Customer, type: :model do
  describe 'is_empty?' do
    let(:waiting_room){ WaitingRoom.new() }
    context 'when nobody is in the waiting room' do
      it 'returns true' do
        expect(waiting_room.is_empty?).to be true
      end
    end

    context 'when there are people in the waiting room ' do
      before do
        waiting_room.customers << Customer.new('Name', Barbershop.new('Name'))
      end
      it 'return false' do
        expect(waiting_room.is_empty?).to be false
      end
    end
  end

  describe 'has_capacity?' do
    let(:waiting_room){ WaitingRoom.new() }
    context 'when there are fewer than max people' do
      before do
        waiting_room.customers << Customer.new('Name', Barbershop.new('Name'))
      end

      it 'returns true' do
        expect(waiting_room.has_capacity?).to be true
      end
    end

    context 'when there are people in the waiting room ' do
      before do
        5.times do
          waiting_room.customers << Customer.new('Name', Barbershop.new('Name'))
        end
      end

      it 'return false' do
        expect(waiting_room.has_capacity?).to be false
      end
    end
  end
end