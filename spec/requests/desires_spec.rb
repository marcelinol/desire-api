require 'rails_helper'

RSpec.describe 'Desires API', type: :request do
  let!(:desires) { create_list(:desire, 10) }

  describe 'GET /desires' do
    before { get '/desires' }

    it 'return desires', :aggregate_failures do
      expect(response.content_type).to eq('application/json')
      expect(json).not_to be_empty
      expect(json.size).to equal(10)
      expect(json.first['name']).to eq(Desire.first.name)
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /desire' do
    context 'with valid attributes' do
      let(:attributes) { { desire: { name: 'sunglasses' } } }

      it 'responds with created' do
	post '/desires', params: attributes

	expect(response).to have_http_status(:created)
      end

      it 'creates a new desire', :aggregate_failures do
	expect { post '/desires', params: attributes }.to change { Desire.count }.by(1)
	expect(Desire.last.name).to eq(attributes[:desire][:name])
      end
    end

    context 'with invalid attributes' do
      let(:attributes) { { desire: { } } }

      it 'responds with unprocessable entity' do
	post '/desires', params: attributes

	expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
