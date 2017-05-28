require 'rails_helper'

RSpec.describe Desire, type: :model do
  describe 'validations' do
    let(:subject) { Desire.new }

    context 'when desire has no name' do
      it { is_expected.not_to be_valid }
    end

    context 'when desire has a name' do
      let(:subject) { Desire.new(name: 'sunglasses') }

      it { is_expected.to be_valid }
    end
  end
end
