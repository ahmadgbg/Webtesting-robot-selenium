*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary
Resource  ..//Resources/keywords.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

${BROWSER} =  chrome
${URL} =  http://www.amazon.com


*** Test Cases ***
User can access Amazon.com
        [Documentation]             Test for accessing website Amazon.com
        [Tags]                      Access Test
        Go to Web Page

User can conduct a search
        [Documentation]             Test for accessing website Amazon.com and searching for ferrari 458
        [Tags]                      Access and Searching for ferrari 458
        Go to Web Page
        Search for Product          ferrari 458  results for "ferrari 458"

User can conduct another search
        [Documentation]             Test for accessing website Amazon.com and searching for tesla model x
        [Tags]                      Access and Searching for tesla model x
        Go to Web Page
        Search for Product          tesla model x  results for "tesla model x"