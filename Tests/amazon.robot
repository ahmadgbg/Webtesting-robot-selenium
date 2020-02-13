*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary

*** Test Cases ***
User can access Amazon.com
        [Documentation]         Test for accessing website Amazon.com
        [Tags]                  Access Test
        Open Browser            about:blank  chrome
        Go To                   http://www.amazon.com
        Wait Until Page Contains    Your Amazon.com
        Close Browser