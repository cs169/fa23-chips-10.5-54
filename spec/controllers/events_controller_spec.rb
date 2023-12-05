# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # 在 before 块中创建事件和县
  before do
    @state = State.create(
      symbol:       'CA',
      name:         'California',
      fips_code:    6,
      is_territory: 0,
      lat_min:      32.5,
      lat_max:      42.0,
      long_min:     -124.3,
      long_max:     -114.1
    )

    @county = County.create(
      name:       'Los Angeles',
      state:      @state,
      fips_code:  37,
      fips_class: 'H1'
    )

    @events = 3.times.map do |i|
      Event.create(
        name:        "Event #{i}",
        county:      @county,
        description: "Description for Event #{i}",
        start_time:  Time.zone.now,
        end_time:    Time.zone.now + 1.day
      )
    end
  end

  describe 'GET #index' do
    context 'when no filter is applied' do
      it 'assigns all events to @events' do
        get :index
        expect(assigns(:events)).to match_array(@events)
      end
    end

    context 'when filtered by state only' do
      it 'assigns events from the specific state to @events' do
        get :index, params: { 'filter-by': 'state-only', state: 'CA' }
        expect(assigns(:events)).to match_array(@events)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested event to @event' do
      event = @events.first
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
