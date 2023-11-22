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

Then('I should see a map of {string}') do |state|
  expect(page).to have_css("#actionmap-state-counties-view")
end

Given('I am on the state page for {string}') do |state|
  visit state_map_path(state_symbol: state.downcase[0, 2])
end

When('I click on the county {string}') do |county_name|
  within("#actionmap-state-counties-table") do
    # 假设每个县的名称都是唯一的，并且在表格中呈现
    find('td', text: county_name).find('+ td + td + td a').click
  end
end
Then('I should see representatives for {string}') do |county|
  # 这里需要确保页面上显示了相应的代表信息
  # 您可能需要根据实际页面元素进行调整
  expect(page).to have_content("Representatives for #{county}")
end