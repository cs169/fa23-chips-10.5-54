# require 'rails_helper'

# RSpec.describe SessionController, type: :controller do
#   describe 'GET #index' do  # Assuming 'index' is an existing action
#     context 'when user is logged in' do
#       it 'allows access to the action' do
#         user = User.create(
#           provider: 1,  # 示例值
#           uid: "123456",  # 示例值
#           email: "user@example.com",
#           first_name: "John",
#           last_name: "Doe"
#         )
#         session[:current_user_id] = user.uid

#         get :index  # Use an actual action like 'index'
#         expect(response).to be_successful
#         # Assuming @current_user is set in the action
#         expect(assigns(:current_user)).to eq(user)  
#       end
#     end

#     context 'when user is not logged in' do
#       it 'redirects to the login page and sets destination_after_login' do
#         get :index  # Use an actual action like 'index'

#         expect(session[:destination_after_login]).to eq(request.fullpath)
#         expect(response).to redirect_to(login_url)
#       end
#     end
#   end
# end
