Given /^I am on (.*)$/ do |url|
	visit url
end 

When /^I click "([^\"]*)"$/ do |value|
	click_link(value)
end 

Then /^I should be redirected to (.*)$/ do |url|
	expect(page).to have_current_path(url)
end