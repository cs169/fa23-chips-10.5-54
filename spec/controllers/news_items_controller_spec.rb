require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do
  let!(:representative) { 
    Representative.create(name: "John Doe", position: "Senator")
  }
  
  let!(:news_items) { 
    3.times.map do |i| 
      NewsItem.create(
        title: "News Title #{i}", 
        content: "Content for news item #{i}",
        published_on: Date.today - i.days,
        representative: representative
      )
    end 
  }

  describe 'GET #index' do
    it 'assigns all news items of a representative to @news_items and renders the index template' do
      get :index, params: { representative_id: representative.id }
      expect(assigns(:news_items)).to match_array(news_items)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested news item to @news_item and renders the show template' do
      news_item = news_items.first
      get :show, params: { id: news_item.id, representative_id: representative.id }
      expect(assigns(:news_item)).to eq(news_item)
      expect(response).to render_template(:show)
    end
  end
end
