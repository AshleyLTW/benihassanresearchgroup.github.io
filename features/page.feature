Feature: Testing a photo page
	Ensuring that all the buttons work

	Scenario: The Photograph button is clicked
	Given I have loaded https://benihassan.com/dictionary/Kanawati-Evans-BH1-Pl-43a-Beni-Hassan-Khnumhotep-II-Tomb-3-Chapel-Scene-North-wall-Centre-section-Wall/ 
	And I click on "lineartBtn"
	When I click on "photoBtn"
	Then "selected" should equal "photo" in "amp-selector"

	Scenario: The Lineart button is clicked
	Given I have loaded https://benihassan.com/dictionary/Kanawati-Evans-BH1-Pl-43a-Beni-Hassan-Khnumhotep-II-Tomb-3-Chapel-Scene-North-wall-Centre-section-Wall/ 
	When I click on "lineartBtn"
	Then "selected" should equal "lineart" in "amp-selector"

	Scenario: The Hieroglyphs button is clicked
	Given I have loaded https://benihassan.com/dictionary/Kanawati-Evans-BH1-Pl-43a-Beni-Hassan-Khnumhotep-II-Tomb-3-Chapel-Scene-North-wall-Centre-section-Wall/ 
	When I click on "heiroBtn"
	Then "selected" should equal "hiero" in "amp-selector"

	Scenario: The Description button is clicked
	Given I have loaded https://benihassan.com/dictionary/Kanawati-Evans-BH1-Pl-43a-Beni-Hassan-Khnumhotep-II-Tomb-3-Chapel-Scene-North-wall-Centre-section-Wall/ 
	And I click where "option" equals "b1"
	When I click where "option" equals "a1"
	Then "selected" should equal "photo" in "amp-selector"