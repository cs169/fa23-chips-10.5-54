# frozen_string_literal: true

Given('a user exists with uid {string} and provider {string}') do |uid, provider|
  User.create(uid: uid, provider: User.providers[provider.to_sym])
end

Given('a user exists with first name {string} and last name {string}') do |first_name, last_name|
  User.create(first_name: first_name, last_name: last_name)
end

When('I try to create a user with uid {string} and provider {string}') do |uid, provider|
  @new_user = User.new(uid: uid, provider: User.providers[provider.to_sym])
end

When('I check the user\'s full name') do
  @user = User.last
  @full_name = @user.name
end

When('I check the user\'s authentication provider') do
  @user = User.last
  @auth_provider = @user.auth_provider
end

Then('I should see a uniqueness validation error') do
  expect(@new_user.valid?).to be false
  expect(@new_user.errors[:uid]).to include('has already been taken')
end

Then('I should see {string}') do |expected_result|
  expect(@full_name).to eq(expected_result) if defined?(@full_name)
  expect(@auth_provider).to eq(expected_result) if defined?(@auth_provider)
end
