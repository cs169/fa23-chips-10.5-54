# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # Create necessary data for testing
  let!(:setup_data) do
    # state = State.create(
    #   symbol:       'CA',
    #   name:         'California',
    #   fips_code:    6,
    #   is_territory: 0,
    #   lat_min:      32.5,
    #   lat_max:      42.0,
    #   long_min:     -124.3,
    #   long_max:     -114.1
    # )

    # county = County.create(
    #   name:       'Los Angeles',
    #   state:      state,
    #   fips_code:  37,
    #   fips_class: 'H1'
    # )

    # other_state = State.create(
    #   symbol:       'NY',
    #   name:         'New York',
    #   fips_code:    36,
    #   is_territory: 0,
    #   lat_min:      40.5,
    #   lat_max:      45.0,
    #   long_min:     -79.8,
    #   long_max:     -71.9
    # )

    # other_county = County.create(
    #   name:       'Some County',
    #   state:      other_state,
    #   fips_code:  100,
    #   fips_class: 'H2'
    # )
  end

  let(:events) do
    3.times.map do |i|
      Event.create(
        name:        "Event #{i}",
        county:      County.find_by(name: 'Los Angeles'), # 使用现有的县
        description: "Description for Event #{i}",
        start_time:  Time.zone.now,
        end_time:    Time.zone.now + 1.day
      )
    end
  end
  let(:other_event) do
    Event.create(
      name:        'Other Event',
      county:      County.find_by(name: 'Some County'), # 使用现有的县
      description: 'Description for Other Event',
      start_time:  Time.zone.now,
      end_time:    Time.zone.now + 1.day
    )
  end

  describe 'GET #index' do
    context 'when no filter is applied' do
      it 'assigns all events to @events' do
        get :index
        expect(assigns(:events)).to match_array(Event.all)
      end
    end

    context 'when filtered by state only' do
      it 'assigns events from the specific state to @events' do
        get :index, params: { 'filter-by': 'state-only', state: 'CA' }
        expect(assigns(:events)).to match_array(events)
        expect(assigns(:events)).not_to include(other_event)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested event to @event' do
      event = events.first
      get :show, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
    end

    it 'raises an error when the event is not found' do
      expect do
        get :show, params: { id: 9999 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
