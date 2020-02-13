*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Keywords ***
Begin Web Test
        Open Browser                about:blank  chrome
Go to Web Page
        Load Page
        Verify Page Loaded

Load Page
        Go To                       http://www.amazon.com
Verify Page Loaded
        Wait Until Page Contains    Your Amazon.com

Search for Product
        Enter Search Term
        Submit Search
        Verify Search Completed

Enter Search Term
        Input Text                  id:twotabsearchtextbox  ferrari 458

Submit Search
        Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify Search Completed
        Wait Until Page Contains    results for "ferrari 458"
End Web Test
        Close Browser

*** Test Cases ***
User can access Amazon.com
        [Documentation]             Test for accessing website Amazon.com
        [Tags]                      Access Test
        Go to Web Page

User can conduct a search
        [Documentation]             Test for accessing website Amazon.com
        [Tags]                      Access and Search
        Go to Web Page
        Search for Product