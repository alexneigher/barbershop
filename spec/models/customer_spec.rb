require 'spec_helper'

RSpec.describe Customer, type: :model do
  describe 'state transitions' do
    let(:customer){ Customer.new("Customer-1", Barbershop.new("Shop")) }

    context 'when transitioning from new to waiting' do
      it 'logs a message' do
        expect(Logger).to receive(:log).with(0, "Customer-1 entered")
        customer.enter_waiting_room!
      end
    end

    context 'when transitioning into frustrated' do
      it 'does not allow a direct transition from new' do
        expect(customer.leave_frustrated!).to be false
      end

      it 'allows a transition from waiting to frustrated' do
        customer.enter_waiting_room! #trigger first transition
        expect(customer.leave_frustrated!).to be true
      end
    end

    # TODO
    # follow similar pattern for remining transitions
  end

end