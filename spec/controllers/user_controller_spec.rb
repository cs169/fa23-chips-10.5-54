require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let!(:user) { User.create(email: 'user@example.com', password: 'password') }

  describe 'GET #profile' do
    context 'when user is logged in' do
      before do
        session[:current_user_id] = user.id
      end

      it 'assigns the logged-in user to @user' do
        get :profile
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the profile template' do
        get :profile
        expect(response).to render_template(:profile)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the login page' do
        get :profile
        expect(response).to redirect_to(login_url) # replace login_url with your actual login path
      end
    end
  end
end
