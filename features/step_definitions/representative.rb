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

Then("I should see Martin Heinrich's name") do
  expect(page).to have_content('Martin Heinrich')
end

Then("I should see Martin Heinrich's OCD ID") do
  expect(page).to have_content('ocd-division/country:us/state:nm')
end

Then("I should see Martin Heinrich's title") do
  expect(page).to have_content('U.S. Senator')
end

Then("I should see Martin Heinrich's contact address") do
  expect(page).to have_content('303, Washington, DC 20510')
end

Then("I should see Martin Heinrich's political party") do
  expect(page).to have_content('Democratic Party')
end

Then("I should see Martin Heinrich's photo") do
  expect(page).to have_selector('img')
end
