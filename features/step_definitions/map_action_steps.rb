# frozen_string_literal: true

Given('I am on the map page') do
  visit root_path
end

Given('I am on the {string} state page') do |state|
  visit "/state/#{state}"
end

When('I am on the create article page') do
  visit '/representatives/3/news_items'
end

When('I click the button Counties in California') do
  page.find(:css, '#actionmap-counties-details-header > h3 > button').click
end

When('I click the button Counties in New York') do
  page.find(:css, '#actionmap-counties-details-header > h3 > button').click
end

When('I click the button view Butte County') do
  page.find(:css, '#actionmap-state-counties-table > tbody > tr:nth-child(4) > td:nth-child(4) > a').click
end

When('I click the button view Erie County') do
  page.find(:css, '#actionmap-state-counties-table > tbody > tr:nth-child(15) > td:nth-child(4) > a').click
end

Then('I should see the map of the United States') do
  expect(page).to have_css('svg#actionmap-national-view')
end

Then('I should be on Butte Representatives page') do
  current_path = URI.parse(current_url).path
  if current_path.respond_to?(:should)
    expect(current_path).to eq('/search/Butte%20County')
  else
    assert_equal '/search/Butte%20County', current_path
  end
end

Then('I should be on Erie Representatives page') do
  current_path = URI.parse(current_url).path
  if current_path.respond_to?(:should)
    expect(current_path).to eq('/search/Erie%20County')
  else
    assert_equal '/search/Erie%20County', current_path
  end
end

Then('I should see {string}') do |text|
  if page.respond_to?(:should)
    expect(page).to have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then('I should not see {string}') do |text|
  if page.respond_to?(:should)
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
