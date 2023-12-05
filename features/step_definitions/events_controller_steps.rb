# frozen_string_literal: true

# Step definitions for setting up events
Given('there are events in different states') do
  # Create states and events in those states
  state1 = State.create(symbol: 'CA', name: 'California')
  state2 = State.create(symbol: 'NY', name: 'New York')
  3.times do |i|
    Event.create(title: "Event CA #{i}", state: state1)
    Event.create(title: "Event NY #{i}", state: state2)
  end
end

Given('there are events in different counties') do
  # Create states, counties, and events in those counties
  state = State.create(symbol: 'CA', name: 'California')
  county1 = County.create(name: 'Los Angeles', state: state)
  county2 = County.create(name: 'San Francisco', state: state)
  3.times do |i|
    Event.create(title: "Event LA #{i}", county: county1)
    Event.create(title: "Event SF #{i}", county: county2)
  end
end

Given('there is an event with id {string}') do |id|
  Event.create(id: id, title: 'Sample Event')
end

# Steps for interacting with the web page
When('I filter events by state {string}') do |state_symbol|
  # Adjust this step based on how your filtering UI works
  select state_symbol, from: 'State' # Assuming you have a dropdown for state
  click_button 'Filter' # Assuming you have a filter button
end

When('I filter events by state {string} and county {string}') do |state_symbol, county_name|
  # Adjust this step based on how your filtering UI works
  select state_symbol, from: 'State'
  select county_name, from: 'County'
  click_button 'Filter'
end

When('I visit the event page with id {string}') do |id|
  visit event_path(id)
end

When('I filter events by an invalid state') do
  # Use a state symbol that doesn't exist
  fill_in 'State', with: 'ZZ'
  click_button 'Filter'
end

When('I filter events by state {string} and an invalid county') do |state_symbol|
  select state_symbol, from: 'State'
  fill_in 'County', with: 'InvalidCounty'
  click_button 'Filter'
end

# Steps for verifying the outcome
Then('I should see events only from the state {string}') do |state_name|
  expect(page).to have_content(state_name)
  # Add additional checks as necessary
end

Then('I should see events only from {string} county in {string}') do |county_name, state_name|
  expect(page).to have_content("#{county_name} County in #{state_name}")
  # Add additional checks as necessary
end

Then('I should see details of the event') do
  expect(page).to have_content('Sample Event')
  # Add additional checks as necessary
end

Then('I should see an appropriate error message') do
  expect(page).to have_content('No events found') # Replace with your actual error message
end
