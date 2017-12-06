# Managing Navigation

* The Salesforce app manages navigation using events. The navigation event framework is made available as a JavaScript object that provides a number of utility functions that make creating programmatic navigation that “just works” a breeze. The advantage is a navigation experience that’s more natural for a mobile context. 

Programmatic navigation for Visualforce pages generally works something like this:
* A user invokes a Visualforce page, usually from the navigation menu, or from an action in the action bar.
* The Visualforce page loads and runs, including any custom controller or extension code called by the page.
* The user interacts with the page in some way: for example, to fill in some form values.
* The user submits the form, or performs some other action on the page that commits a change.
* Controller or extension code runs, saving the changes to Salesforce, and returning the results of the action.
* The Visualforce page, using JavaScript response handlers, receives the results of the action, and when successful, responds by redirecting the user to a new page that shows the results of their action.
