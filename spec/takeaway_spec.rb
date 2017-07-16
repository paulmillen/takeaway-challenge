require 'takeaway'

describe Takeaway do

  subject("takeaway") { described_class.new(order) }
  let(:order) { double('order') }

  describe '#menu' do

    it 'tells the menu to print' do
      expect { takeaway.menu }.to output("1: Burger, £5.50\n2: Pizza, £5.00\n3: Noodles, £6.00\n4: Curry, £8.00\n").to_stdout
    end
  end

  describe '#new_order' do

    it 'creates a new order' do
      takeaway.new_order(1)
      expect(takeaway.order).not_to be_nil
    end
  end

  describe '#breakdown' do

    it 'requests a breakdown from @order' do
      allow(order).to receive(:breakdown)
      allow(order).to receive(:total)
      expect(order).to receive(:breakdown)
      takeaway.breakdown
    end
  end

  describe '#confirm' do

    it { is_expected.to respond_to :confirm }
  end



end
