# require 'rails_helper'

# RSpec.describe MyNewsItemsController, type: :controller do
#   let!(:representative) do
#     Representative.create(
#       name: "John Doe",
#       title: "Senator",  # 'position' 字段在 schema 中不存在，改为 'title'
#       ocdid: "ocdid_example",  # 示例值，根据需要调整
#       street: "123 Example St",  # 示例值，根据需要调整
#       city: "Example City",  # 示例值，根据需要调整
#       state: "Example State",  # 示例值，根据需要调整
#       zip: "12345",  # 示例值，根据需要调整
#       party: "Example Party",  # 示例值，根据需要调整
#       photo_url: "http://example.com/photo.jpg"  # 示例值，根据需要调整
#     )
#   end
  
#   let!(:news_item) do
#     NewsItem.create(
#       title: "New Policy Update",
#       description: "Description of the policy update",
#       link: "http://example.com/news",
#       representative: representative
#     )
#   end
  

#   describe 'GET #new' do
#     it 'assigns a new news_item and renders the new template' do
#       get :new, params: { representative_id: representative.id }
#       expect(assigns(:news_item)).to be_a_new(NewsItem)
#       expect(response).to render_template(:new)
#     end
#   end

#   describe 'GET #edit' do
#     it 'assigns the requested news_item and renders the edit template' do
#       get :edit, params: { id: news_item.id, representative_id: representative.id }
#       expect(assigns(:news_item)).to eq(news_item)
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid parameters' do
#       let(:valid_attributes) do
#         {
#           title: "Breaking News Title",
#           description: "Details about the breaking news",
#           link: "http://example.com/news",
#           representative_id: representative.id
#         }
#       end

#       it 'creates a new NewsItem and redirects to the show page' do
#         expect {
#           post :create, params: { news_item: valid_attributes, representative_id: representative.id }
#         }.to change(NewsItem, :count).by(1)
#         expect(response).to redirect_to(representative_news_item_path(representative, NewsItem.last))
#         expect(flash[:notice]).to eq('News item was successfully created.')
#       end
#     end

#     context 'with invalid parameters' do
#       let(:invalid_attributes) do
#         {
#           title: "",
#           description: "Invalid update"
#         }
#       end

#       it 'does not create a new NewsItem and renders the new template' do
#         expect {
#           post :create, params: { news_item: invalid_attributes, representative_id: representative.id }
#         }.to change(NewsItem, :count).by(0)
#         expect(response).to render_template(:new)
#       end
#     end
#   end

#   describe 'PATCH #update' do
#     context 'with valid parameters' do
#       let(:valid_update_attributes) do
#         {
#           title: "Updated News Title",
#           description: "Updated details about the news",
#           link: "http://example.com/updated_news"
#         }
#       end

#       it 'updates the requested news_item and redirects to the show page' do
#         patch :update, params: { id: news_item.id, news_item: valid_update_attributes, representative_id: representative.id }
#         news_item.reload
#         expect(news_item.title).to eq("Updated News Title")
#         expect(news_item.description).to eq("Updated details about the news")
#         expect(response).to redirect_to(representative_news_item_path(representative, news_item))
#         expect(flash[:notice]).to eq('News item was successfully updated.')
#       end
#     end

#     context 'with invalid parameters' do
#       let(:invalid_update_attributes) do
#         {
#           title: "",
#           description: "Invalid update"
#         }
#       end

#       it 'does not update the news_item and renders the edit template' do
#         patch :update, params: { id: news_item.id, news_item: invalid_update_attributes, representative_id: representative.id }
#         expect(response).to render_template(:edit)
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'destroys the requested news_item and redirects to the news_items list' do
#       expect {
#         delete :destroy, params: { id: news_item.id, representative_id: representative.id }
#       }.to change(NewsItem, :count).by(-1)
#       expect(response).to redirect_to(representative_news_items_path(representative))
#       expect(flash[:notice]).to eq('News was successfully destroyed.')
#     end
#   end
# end
