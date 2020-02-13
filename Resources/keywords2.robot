*** Keywords ***
Begin Web Test
        Open Browser                about:blank  ${BROWSER}
        Maximize Browser Window
Go to Web Page
        Load Page
        Verify Page Loaded

Load Page
        Go To                       ${URL}
Verify Page Loaded
        ${link_text} =              Get Text  id:nav-your-amazon
        Should Be Equal             ${link_text}  Your Amazon.com

Search for Product
        [Arguments]                 ${search_term}  ${search_results}
        Enter Search Term           ${search_term}
        Submit Search
        Verify Search Completed     ${search_term}  ${search_results}

Enter Search Term
        [Arguments]                 ${search_term}
        Input Text                  id:twotabsearchtextbox  ${search_term}

Submit Search
        Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Verify Search Completed
        [Arguments]                 ${search_term}  ${search_results}
        ${results_text} =           Set Variable    results for "${search_term}"
        Should Be Equal             ${results_text}  ${search_results}

Add Item
        Enter Item
        Add Item to Cart
        Verify Item in Cart
        Go to Cart
        Verify Item inside Cart

Enter Item
        ${ITEM_TEXT} =               Get Text   xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/h2/a/span
        Click Element                xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/h2/a/span
Add Item to Cart
        Wait Until Page Contains Element    id:add-to-cart-button
        Click Element                id:add-to-cart-button

Verify Item in Cart
        Wait Until Page Contains Element    id:hlb-ptc-btn-native
        ${checkout_text} =          Get Text  id:hlb-ptc-btn-native
        Should Be Equal             ${checkout_text}  Proceed to checkout (1 item)
Go to Cart
        Click Element                id:hlb-view-cart-announce

Verify Item inside Cart
        Wait Until Page Contains Element    class:sc-product-title
        ${item_text} =                      Get Text       class:sc-product-title
       Should Be Equal              ${ITEM_TEXT}    ${item_text}
End Web Test
        Close Browser
