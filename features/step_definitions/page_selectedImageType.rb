Given /^I have loaded (.*)$/ do |url|
	visit url
end 

Given /^I click on "([^\"]*)"$/ do |value|
	find_by_id(value).click
end 

# When /^I click on "([^\"]*)"$/ do |value|
# 	click_link(value)
# end 

Then /^"([^\"]*)" should equal "([^\"]*)" in "([^\"]*)"/ do |attribute, value, tag|
	@path = "//body/amp-selector[@selected='" + value + "']"
	expect(page).to have_xpath(@path)
end