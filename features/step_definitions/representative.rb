# frozen_string_literal: true

When('I visit the representatives search page') do
  visit('/representatives')
end

When('I search with a New Mexico address') do
  fill_in('address', with: 'New Mexico')
  click_button('Search')
end

When("I click on Martin Heinrich's profile in the search results") do
  click_link('Martin Heinrich')
end

Then("I should see Martin Heinrich's photo") do
  expect(page).to have_selector('img')
end
