require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe 'GET #some_action' do
    context 'when user is logged in' do
      it 'allows access to the action' do
        user = create(:user)
        session[:current_user_id] = user.id

        get :some_action
        expect(response).to be_successful
        expect(assigns(:current_user)).to eq(user)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the login page and sets destination_after_login' do
        get :some_action

        expect(session[:destination_after_login]).to eq(request.env['REQUEST_URI'])
        expect(response).to redirect_to(login_url)
      end
    end
  end
end
