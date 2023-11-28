Given('I am on the "Representatives Search" page') do
  visit '/search/Koochiching%20County' 
end

When('I click on the name of a representative') do
  find("a[href='/representatives/128']").click # Replace with the correct CSS selector
end

Then('I should be redirected to the representative\'s profile page') do
  expect(current_path).to match('/representatives/128') # Replace with a regex matching the profile page URL pattern
end

And('I should see the representative\'s name, contact address, political party, and photo') do
  expect(page).to have_content('name') # Replace with dynamic content checks as needed
  expect(page).to have_css('css_selector_for_contact_address')
  expect(page).to have_content('political_party')
  expect(page).to have_css('css_selector_for_photo')
end

Given('I am on a representative\'s profile page') do
  visit '/representative_profile_page' # Replace with the correct path
end

Then('I should see the representative\'s name, office, contact address, political party, and photo') do
  # Similar checks as the previous scenario, but add office information
end

And('this information should match the data from the Google Civic Information API') do
  # This step might involve comparing the displayed data with mocked API responses or using a different approach depending on your test setup.
end

Given('I am on a representative\'s profile page') do
  visit '/representative_profile_page' # Replace with the correct path
end

Then('the page should be styled using Bootstrap') do
  expect(page).to have_css('.bootstrap_class') # Replace with checks for Bootstrap-specific classes
end

And('the layout should be clean and user-friendly') do
  # This step is subjective and might involve checking for specific layout elements, spacing, or other design-related aspects.
end

