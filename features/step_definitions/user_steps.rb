# frozen_string_literal: true

Given('a user exists with uid {string} and provider {string}') do |uid, provider|
  User.create(uid: uid, provider: User.providers[provider.to_sym])
end

When('I try to create a user with uid {string} and provider {string}') do |uid, provider|
  @new_user = User.new(uid: uid, provider: User.providers[provider.to_sym])
end

Then('I should see a uniqueness validation error') do
  expect(@new_user.valid?).to be false
  expect(@new_user.errors[:uid]).to include('has already been taken')
end
