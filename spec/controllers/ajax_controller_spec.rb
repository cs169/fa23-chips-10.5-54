require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  let!(:state) { 
    State.create(
      symbol: 'CA', 
      name: 'California', 
      fips_code: '06', 
      is_territory: false,
      lat_min: 32.5, 
      lat_max: 100,
      long_min: 500,
      long_max: 2000,
      created_at: Time.now, 
      updated_at: Time.now
    )
  }
  let!(:counties) { 
    3.times.map { |i| 
      County.create(
        name: "County #{i}", 
        state: state,
        fips_code: '06', 
        fips_class: '1'
        # lat_min: 32.5, 
        # lat_max: 100,
        # long_min: 500,
        # long_max: 2000,
        # created_at: Time.now, 
        # updated_at: Time.now
      ) 
    }
  }

  describe 'GET #counties' do
    context 'when state is found' do
      it 'returns the counties for the given state as JSON' do
        get :counties, params: { state_symbol: state.symbol }, format: :json
        expect(response.content_type).to eq('application/json')
        expected_response = counties.map { |county| { 'id' => county.id, 'name' => county.name } }
        expect(JSON.parse(response.body)).to match_array(expected_response)
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
