*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary
Resource  ..//Resources/keywords2.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

${BROWSER} =  chrome
${URL} =  http://www.amazon.com
${ITEM_TEXT} =  null


*** Test Cases ***
User can access Amazon.com
        [Documentation]             Test for accessing website Amazon.com
        [Tags]                      Access Test
        Go to Web Page
        Search for Product          audi r8 model car  results for "audi r8 model car"
        Add Item
