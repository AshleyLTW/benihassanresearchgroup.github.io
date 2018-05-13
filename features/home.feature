Feature: Testing the Home page

	Scenario: The VD button is clicked
	Given I am on https://benihassan.com
	When I click "Visual Dictionary"
	Then I should be redirected to https://benihassan.com/dictionary/

	Scenario: The Site button is clicked 
	Given I am on https://benihassan.com
	When I click "Site"
	Then I should be redirected to https://benihassan.com/site/

	Scenario: The Project button is clicked 
	Given I am on https://benihassan.com
	When I click "Project"
	Then I should be redirected to https://benihassan.com/project/