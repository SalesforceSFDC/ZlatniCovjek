# Managing Navigation
* [Managing Navigation - Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.salesforce1.meta/salesforce1/vf_dev_best_practices_navigation.htm)
* [Creating Visualforce Pages That Work in Mobile and Desktop](https://developer.salesforce.com/docs/atlas.en-us.salesforce1.meta/salesforce1/vf_dev_best_practices_pages_multipurpose.htm)
#

* The Salesforce app manages navigation using events. The navigation event framework is made available as a JavaScript object that provides a number of utility functions that make creating programmatic navigation that “just works” a breeze. The advantage is a navigation experience that’s more natural for a mobile context. 

Programmatic navigation for Visualforce pages generally works something like this:
* A user invokes a Visualforce page, usually from the navigation menu, or from an action in the action bar.
* The Visualforce page loads and runs, including any custom controller or extension code called by the page.
* The user interacts with the page in some way: for example, to fill in some form values.
* The user submits the form, or performs some other action on the page that commits a change.
* Controller or extension code runs, saving the changes to Salesforce, and returning the results of the action.
* The Visualforce page, using JavaScript response handlers, receives the results of the action, and when successful, responds by redirecting the user to a new page that shows the results of their action.


* sforce.one - utility Javascript object.  This object provides a number of functions that trigger navigation events when they run. To use these functions, you can call them directly from your page’s JavaScript code, or you can attach calls as click handlers to elements on the page.

* the sforce object is injected onto pages only inside the app. This means that, for pages shared between the Salesforce app and the full Salesforce site, you’ll want to write code that uses the sforce object when it’s available, and standard Visualforce navigation when it’s not.

```apex
// Go back to the Account detail page
if( (typeof sforce != 'undefined') && sforce && (!!sforce.one) ) {
    // Salesforce app navigation
    sforce.one.navigateToSObject(aId);
}
else {
    // Set the window's URL using a Visualforce expression
    window.location.href = 
        '{!URLFOR($Action.Account.View, account.Id)}';
}

```

## Visualforce Page Navigation

