# frozen_string_literal: true

Given('I am on the map page') do
  visit root_path
end

Then('I should see the map of the United States') do
  expect(page).to have_css('svg#actionmap-national-view')
end

Given('I am on the {string} state page') do |state|
  visit state_map_path(state_symbol: state.downcase[0, 2])
end

Then('I should see a map of {string}') do |_state|
  expect(page).to have_css('#actionmap-state-counties-view')
end

Given('I am on the state page for {string}') do |state|
  visit state_map_path(state_symbol: state.downcase[0, 2])
end
