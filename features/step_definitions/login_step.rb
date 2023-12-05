# frozen_string_literal: true

Given('I am on the login page') do
  visit '/login'
end

When('I click the botton {string}') do |button|
  click_button(button)
end

Then('I will log out') do
  step 'I am on the login page'
  click_link 'Logout'
end

Then('Redirect to home page') do
  expect(page).to have_current_path('/')
end
