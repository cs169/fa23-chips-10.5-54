require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  let!(:state) { State.create(symbol: 'CA', name: 'California') }
  let!(:counties) { 
    3.times.map { |i| County.create(name: "County #{i}", state: state) }
  }

  describe 'GET #counties' do
    context 'when state is found' do
      it 'returns the counties for the given state as JSON' do
        get :counties, params: { state_symbol: state.symbol }, format: :json
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to eq(counties.map { |county| { 'id' => county.id, 'name' => county.name } })
      end
    end

    context 'when state is not found' do
      it 'returns an empty JSON response' do
        get :counties, params: { state_symbol: 'ZZ' }, format: :json
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end
end
