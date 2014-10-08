require 'rails_helper'

describe Event do
  describe '#name' do
    context '空白のとき' do
      let(:event) { Event.new(name: '') }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end