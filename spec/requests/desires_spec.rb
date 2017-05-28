require 'rails_helper'

RSpec.describe 'Desires API', type: :request do
  let!(:desires) { create_list(:desire, 10) }

  describe 'GET /desires' do
    before { get '/desires' }

    it 'return desires', :aggregate_failures do
      expect(json).not_to be_empty
      expect(json.size).to equal(10)
      expect(json.first['name']).to eq(Desire.first.name)
    end

    it { expect(response).to have_http_status(:ok) }
  end
end
