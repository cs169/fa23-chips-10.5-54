# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepresentativesController, type: :controller do
  let!(:representatives) do
    3.times.map do |i|
      Representative.create(
        name:      "Representative #{i}",
        title:     "Position #{i}", # 使用 'title' 替代原来的 'position'
        ocdid:     "ocdid#{i}", # 示例值，根据需要调整
        street:    "123 Example St #{i}", # 示例值，根据需要调整
        city:      "Example City #{i}", # 示例值，根据需要调整
        state:     "State #{i}", # 示例值，根据需要调整
        zip:       "1234#{i}", # 示例值，根据需要调整
        party:     "Party #{i}", # 示例值，根据需要调整
        photo_url: "http://example.com/photo#{i}.jpg"  # 示例值，根据需要调整
      )
    end
  end

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
