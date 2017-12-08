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

* Action methods return a `PageReference` object with the details of where the user is to be navigated to, and then the Visualforce framework handles the details of sending the right response back to the user’s browser. 
* Standard Controller returns a `PageReference` from its action methods. So, your existing navigation, whether you’re using the Standard Controller or your own custom controller code, continues to work as you expect.
* `PageReference` is on the server-side.

## Lightning Experience Page Navigation
* Lightning Experience manages navigation using events. The navigation event framework is made available as a JavaScript utility object that provides a number of functions.
* `sforce.one` object is automatically added to Visualforce pages when they run in Lightning Experience. This object provides a number of functions that trigger navigation events when the functions are called. To use these functions, you can call them directly from your page’s JavaScript code, or you can attach calls as click (or other) handlers to elements on the page.

## Share Visualforce Pages Between Classic and Lightning Experience 
* `$User.UITheme` returns the look and feel the user is supposed to see
* `$User.UIThemeDisplayed` returns the look and feel the user actually sees

The possible values for `$User.UITheme` and `$User.UIThemeDisplayed` are the same:
* `Theme1`—Obsolete Salesforce theme
* `Theme2`—Salesforce Classic 2005 user interface theme
* `Theme3`—Salesforce Classic 2010 user interface theme
* `Theme4d`—Modern “Lightning Experience” Salesforce theme
* `Theme4t`—Salesforce mobile app Salesforce theme
* `PortalDefault`—Salesforce Customer Portal theme
* `Webstore`—Salesforce AppExchange theme

```Apex
<apex:outputPanel rendered="{! $User.UIThemeDisplayed == 'Theme3' }">
    <apex:outputText value="This is Salesforce Classic."/>
    <apex:outputText value="These are multiple components wrapped by an outputPanel."/>
</apex:outputPanel>
<apex:outputPanel rendered="{! $User.UIThemeDisplayed == 'Theme4d' }">
    <apex:outputText value="Everything is simpler in Lightning Experience."/>
</apex:outputPanel>
```
```Apex
<apex:page standardController="Account">

    <!-- Salesforce Classic "Aloha" theme -->
    <apex:variable var="uiTheme" value="classic2010Theme" 
        rendered="{!$User.UIThemeDisplayed == 'Theme3'}">
        <apex:stylesheet value="{!URLFOR($Resource.AppStyles, 
                                         'classic-styling.css')}" />
    </apex:variable>
    
    <!-- Lightning Desktop theme -->
    <apex:variable var="uiTheme" value="lightningDesktop" 
        rendered="{!$User.UIThemeDisplayed == 'Theme4d'}">
        <apex:stylesheet value="{!URLFOR($Resource.AppStyles, 
                                         'lightning-styling.css')}" />
    </apex:variable>
    
    <!-- Salesforce mobile theme -->
    <apex:variable var="uiTheme" value="Salesforce1" 
        rendered="{!$User.UIThemeDisplayed == 'Theme4t'}">
        <apex:stylesheet value="{!URLFOR($Resource.AppStyles, 
                                         'mobile-styling.css')}" />
    </apex:variable>

    <!-- Rest of your page -->
    
    <p>
        Value of $User.UIThemeDisplayed: {! $User.UIThemeDisplayed }
    </p>
</apex:page>
```

Page that does nothing but inject the `$User.UIThemeDisplayed` value into the right JavaScript context, and then using `<apex:include>` to add it to a page. Then we can test against the injected value in our actual utility code.

Here’s the “shim” Visualforce page that we use to inject the `$User.UIThemeDisplayed` global variable into a JavaScript context, as well as include the JavaScript utility static resource that uses it.

This page does two things. First, it pulls in the JavaScript static resource that contains the actual utility method code. (Which, I promise, we will get to.) Second, it has an inline JavaScript that, because it’s running in a Visualforce page instead of a static resource, can evaluate an expression with the theme global. This script sets a variable inside the ForceUI utility object. This copies the theme value from Visualforce into JavaScript, so that it can be referenced by the JavaScript code that’s in the static resource.

```Apex
<apex:page docType="html-5.0" applyBodyTag="false" applyHtmlTag="false"
           showHeader="false" standardStylesheets="false">

<!-- UIUTILS SCRIPT -->
<apex:includeScript value="{!URLFOR($Resource.ForceUI)}"/>
<!-- UIUTILS SCRIPT -->

<!-- UITHEME INJECTOR -->
<script type="text/javascript">
    (function(myContext){
        // Don't overwrite ourself if we already exist.
        myContext.ForceUI = myContext.ForceUI || {};
        
        // Because this is Visualforce, not a static resource,
        // we can access a global variable in an expression.
        myContext.ForceUI.UserUITheme = '{! $User.UIThemeDisplayed }';
    })(this);
</script>
<!-- UITHEME INJECTOR -->

</apex:page>
```
#
Page that shows how to add the JavaScript utility methods to the page, using the <apex:include> component within the <head> block. At the bottom of the page is a short bit of JavaScript that illustrates how to use the utility methods from within JavaScript. 

```Apex
<apex:page standardController="Account" extensions="ForceUIExtension"
           showHeader="false" standardStylesheets="false"
           applyHtmlTag="false" applyBodyTag="false"
           docType="html-5.0" title="ForceUI Utilities">

<html lang="en">
  <head>
    <title>ForceUI Utilities</title>
    <apex:include pageName="UIThemeUtilsInclude"/>
  </head>

  <body>
      
    <h1>ForceUI Utilities</h1>
    
    <p>This is a page used for testing different ways of determining 
       the user interface context in which it's being displayed.</p>
    
    <h2>$User.UITheme Global Variable</h2>
    
    <p><label>$User.UITheme</label>: {! $User.UITheme }</p>
    <p><label>$User.UIThemeDisplayed</label>: {! $User.UIThemeDisplayed }</p>
    
    
    <h2>UIUtils JavaScript</h2>
    
    <p><label>ForceUI.UserUITheme</label>: 
       <span id="UserUIThemeJS">(loading...)</span></p>
      
    <p><label>isSalesforce1()</label>: 
       <span id="isSalesforce1JS">(loading...)</span></p>
      
    <p><label>isLightningExperience()</label>: 
       <span id="isLightningExperienceJS">(loading...)</span></p>
      
    <p><label>isSalesforceClassic()</label>: 
       <span id="isSalesforceClassicJS">(loading...)</span></p>

    <script type="text/javascript">
      document.addEventListener('DOMContentLoaded', function(event){
          // Diagnostic only -- don't use this value directly
          document.getElementById('UserUIThemeJS').innerHTML = ForceUI.UserUITheme;
          // Instead, use these utility methods
          document.getElementById('isSalesforce1JS').innerHTML = 
              ForceUI.isSalesforce1();
          document.getElementById('isLightningExperienceJS').innerHTML = 
              ForceUI.isLightningExperience();
          document.getElementById('isSalesforceClassicJS').innerHTML = 
              ForceUI.isSalesforceClassic();
      });
    </script>
  </body>
</html>
</apex:page>    
```
#
The utility library that contains the JavaScript utility functions that let you create if expressions to conditionally affect the results of your app’s JavaScript code based on the user interface context it’s running in.

The result of the code executing is a utility object, ForceUI, added to the global scope of your page. The object receives, from the injector JavaScript in the earlier Visualforce shim page, the value of the $User.UIThemeDisplayed global variable. This value is saved in a local variable named UserUITheme, which you should treat as a private implementation detail. 

```Apex 
// This is an anonymous self-executing function closure thingie,
// like all the cool kids are using these days.
(function(myContext){

    // Deal with possible order-of-execution issues.
    // Don't overwrite ourself if we already exist.
    myContext.ForceUI = myContext.ForceUI || {};

    // Utility methods that make simple string comparisons
    // against a local UserUITheme value. This value is
    // injected from a Visualforce page to allow expression
    // evaluation of the $User.UIThemeDisplayed global.
    myContext.ForceUI.isSalesforceClassic = function() {
        return (this.UserUITheme == 'Theme3');
    }
    myContext.ForceUI.isLightningExperience = function() {
        return (this.UserUITheme == 'Theme4d');
    }
    myContext.ForceUI.isSalesforce1 = function() {
        return (this.UserUITheme == 'Theme4t');
    }
})(this);
```
