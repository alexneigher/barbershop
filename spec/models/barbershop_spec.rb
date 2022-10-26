require 'spec_helper'

RSpec.describe Barbershop, type: :model do
  describe 'open/closed states' do
    let(:barbershop){ Barbershop.new('Shop') }

    context 'when transitioning to open' do
      it 'logs a message' do
        expect(Logger).to receive(:log).with(0, "Shop is open for business!")
        barbershop.open!
      end
    end

    context 'when transitioning to closed' do
      before do
        barbershop.open!
      end

      it 'allows the transition if the waiting room is empty' do
        expect(Logger).to receive(:log).with(0, "Shop is closed.")
        barbershop.try_to_close!
        barbershop.close!
        expect(barbershop.state).to eq "closed"

      end

      it 'does not allow the transition if the waiting room is full' do
        barbershop.waiting_room.customers << Customer.new("name", barbershop)
        barbershop.try_to_close!
        barbershop.close!
        expect(barbershop.state).to eq "closing"
      end
    end
    #TODO other state transitions
  end

  describe 'available_barbers_from_shift' do
    let(:barbershop){ Barbershop.new('Shop') }

    context 'when nobody has clocked in' do
      it 'returns the list of barbers currently on shift' do
        expect(barbershop.available_barbers_from_shift(Barbershop::FIRST_SHIFT)).to eq []
      end
    end

    context 'when the shift is populated' do
      before do
        barbershop.active_barbers = Barbershop::FIRST_SHIFT
      end

      it 'returns the list of barbers currently on shift' do
        expect(barbershop.available_barbers_from_shift(Barbershop::FIRST_SHIFT)).to eq Barbershop::FIRST_SHIFT
      end
    end
  end
end