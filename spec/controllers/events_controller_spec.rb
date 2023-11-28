require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # Create necessary data for testing
  let!(:state) { State.create(symbol: 'CA', name: 'California') }
  let!(:county) { County.create(name: 'Los Angeles', state: state) }
  let!(:events) { 3.times.map { |i| Event.create(title: "Event #{i}", state: state, county: county) } }
  let!(:other_event) { Event.create(title: 'Other Event', state: State.create(symbol: 'NY', name: 'New York')) }

  describe 'GET #index' do
    context 'when no filter is applied' do
      it 'assigns all events to @events' do
        get :index
        expect(assigns(:events)).to match_array(Event.all)
      end
    end

    context 'when filtered by state only' do
      it 'assigns events from the specific state to @events' do
        get :index, params: { 'filter-by': 'state-only', 'state': 'CA' }
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
      expect {
        get :show, params: { id: 9999 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
