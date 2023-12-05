require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do
  let!(:representative) do
    Representative.create(
      name: "John Doe",
      title: "Senator",  # 'position' 字段在 schema 中不存在，改为 'title'
      ocdid: "ocdid_example",  # 示例值，根据需要调整
      street: "123 Example St",  # 示例值，根据需要调整
      city: "Example City",  # 示例值，根据需要调整
      state: "Example State",  # 示例值，根据需要调整
      zip: "12345",  # 示例值，根据需要调整
      party: "Example Party",  # 示例值，根据需要调整
      photo_url: "http://example.com/photo.jpg"  # 示例值，根据需要调整
    )
  end
  
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
