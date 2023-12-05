# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  let!(:state) do
    State.create(
      symbol:       'CA',
      name:         'California',
      fips_code:    '06',
      is_territory: false,
      lat_min:      32.5,
      lat_max:      100,
      long_min:     500,
      long_max:     2000,
      created_at:   Time.zone.now,
      updated_at:   Time.zone.now
    )
  end
  let!(:counties) do
    3.times.map do |i|
      County.create(
        name:       "County #{i}",
        state:      state,
        fips_code:  '06',
        fips_class: '1'
      )
    end
  end
  let!(:expected_response) do
    counties.map do |county|
      {
        'id'         => county.id,
        'name'       => county.name,
        'fips_code'  => county.fips_code,
        'fips_class' => county.fips_class,
        'state_id'   => county.state_id,
        'created_at' => county.created_at.iso8601(3),
        'updated_at' => county.updated_at.iso8601(3)
      }
    end
  end

  describe 'GET #counties' do
    context 'when state is found' do
      it 'returns the counties for the given state as JSON' do
        get :counties, params: { state_symbol: state.symbol }, format: :json
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to match_array(expected_response)
      end
    end
  end
end
