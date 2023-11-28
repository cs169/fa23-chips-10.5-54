require 'rails_helper'

RSpec.describe MyEventsController, type: :controller do
  let!(:event) { Event.create(name: "Sample Event", county_id: 1, description: "Event description", start_time: Time.now, end_time: Time.now + 1.hour) }

  describe 'GET #new' do
    it 'assigns a new event and renders the new template' do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested event and renders the edit template' do
      get :edit, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new event and redirects to the events path' do
        valid_attributes = { name: "New Event", county_id: 1, description: "New event description", start_time: Time.now, end_time: Time.now + 2.hours }
        expect {
          post :create, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
        expect(response).to redirect_to(events_path)
        expect(flash[:notice]).to eq('Event was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new event and renders the new template' do
        invalid_attributes = { name: "", county_id: 1, description: "Invalid event" }
        expect {
          post :create, params: { event: invalid_attributes }
        }.to change(Event, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: "Updated Event", description: "Updated event description" } }

      it 'updates the requested event and redirects to the events path' do
        patch :update, params: { id: event.id, event: new_attributes }
        event.reload
        expect(event.name).to eq("Updated Event")
        expect(event.description).to eq("Updated event description")
        expect(response).to redirect_to(events_path)
        expect(flash[:notice]).to eq('Event was successfully updated.')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the event and renders the edit template' do
        patch :update, params: { id: event.id, event: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested event and redirects to the events list' do
      expect {
        delete :destroy, params: { id: event.id }
      }.to change(Event, :count).by(-1)
      expect(response).to redirect_to(events_url)
      expect(flash[:notice]).to eq('Event was successfully destroyed.')
    end
  end
end
