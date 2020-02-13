*** Settings ***
Documentation  This is a test suite that tests the Amazon site
Library  SeleniumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

${BROWSER} =  chrome
${URL} =  http://www.amazon.com

*** Keywords ***
Begin Web Test
        Open Browser                about:blank  ${BROWSER}
Go to Web Page
        Load Page
        Verify Page Loaded

Load Page
        Go To                       ${URL}
Verify Page Loaded
        Wait Until Page Contains    Your Amazon.com

Search for Product
        [Arguments]                 ${search_term}  ${search_results}
        Enter Search Term           ${search_term}
        Submit Search
        Verify Search Completed     ${search_results}

Enter Search Term
        [Arguments]                 ${search_term}
        Input Text                  id:twotabsearchtextbox  ${search_term}

Submit Search
        Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify Search Completed
        [Arguments]                 ${search_results}
        Wait Until Page Contains    ${search_results}
End Web Test
        Close Browser

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