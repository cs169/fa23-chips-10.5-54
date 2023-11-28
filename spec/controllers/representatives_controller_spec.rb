require 'rails_helper'

RSpec.describe RepresentativesController, type: :controller do
  let!(:representatives) { 
    3.times.map { |i| Representative.create(name: "Representative #{i}", position: "Position #{i}") }
  }

  describe 'GET #index' do
    it 'assigns all representatives to @representatives and renders the index template' do
      get :index
      expect(assigns(:representatives)).to match_array(representatives)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested representative to @representative and renders the show template' do
      representative = representatives.first
      get :show, params: { id: representative.id }
      expect(assigns(:representative)).to eq(representative)
      expect(response).to render_template(:show)
    end
  end
end
