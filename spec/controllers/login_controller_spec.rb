require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  # Mock user info as would be provided by OAuth providers
  let(:google_user_info) do
    {
      'provider' => 'google_oauth2',
      'uid' => '123456',
      'info' => {
        'first_name' => 'John',
        'last_name' => 'Doe',
        'email' => 'john.doe@example.com'
      }
    }
  end

  let(:github_user_info) do
    {
      'provider' => 'github',
      'uid' => '123457',
      'info' => {
        'name' => 'Jane Doe',
        'email' => 'jane.doe@example.com'
      }
    }
  end

  describe 'GET #login' do
    it 'renders the login page' do
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe 'POST #google_oauth2' do
    before do
      request.env['omniauth.auth'] = google_user_info
    end

    it 'creates a new Google user and redirects to the destination' do
      expect {
        post :google_oauth2
      }.to change(User, :count).by(1)
      expect(session[:current_user_id]).not_to be_nil
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'POST #github' do
    before do
      request.env['omniauth.auth'] = github_user_info
    end

    it 'creates a new Github user and redirects to the destination' do
      expect {
        post :github
      }.to change(User, :count).by(1)
      expect(session[:current_user_id]).not_to be_nil
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'GET #logout' do
    before do
      session[:current_user_id] = 1
    end

    it 'logs out the user and redirects to the root path' do
      get :logout
      expect(session[:current_user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('You have successfully logged out.')
    end
  end

  describe 'before_action :already_logged_in' do
    context 'when user is already logged in' do
      before do
        session[:current_user_id] = 1
        get :login
      end

      it 'redirects to the user profile page with a notice' do
        expect(response).to redirect_to(user_profile_path)
        expect(flash[:notice]).to eq('You are already logged in. Logout to switch accounts.')
      end
    end
  end
end
