* https://resources.docs.salesforce.com/206/latest/en-us/sfdc/pdf/salesforce1_url_schemes.pdf
#
* SLDS - Salesforce Lightning Design System - CSS framework.
* Lightning Component Framework - UI framework for developing dynamic single-page applications. 

# SLDS

* The `ng-app` directive tells AngularJS that “MobileFrameworksApp” is the root element of the AngularJS application. All AngularJS applications need a root element.
* The `ng-model` directive lets you bind the value of your input field to a variable.
* AngularJS displays your content from the model using the `{{ yourInput }}` expression, where “Input” is your name, company, phone number, and email.
* The `angular.module('MobileFrameworksApp', []);` call in the JavaScript section of the markup defines the module which contains our AngularJS application. The AngularJS module is a container for functions that run when the application starts.

# How to Access Data with Visualforce
### Standard Visualforce
This is the Visualforce described in the Visualforce Basics Trailhead module. Using built-in components and the Standard Controller, it’s incredibly easy to create custom web apps in minutes.
Standard Visualforce works well for apps that will be used on your organization’s internal network, where bandwidth and latency are usually good. But on mobile devices, especially when they’re on less reliable connections, there’s some overhead in standard Visualforce that can make mobile apps perform more slowly. Because speed is essential, we recommend one of the other approaches for your Salesforce apps.

### Remote Objects
Remote Objects, which we’re using throughout this module, is built to be almost as simple to use as standard Visualforce, but optimized for other use cases such as mobile apps.
Remote Objects has two characteristics that make it great for use with the Salesforce app. First, it does away with the view state that’s part of standard Visualforce. View state is extra data that’s passed back and forth between the client browser and the server for every request. It’s part of what makes standard Visualforce simple to implement, but the extra data and requests can be a burden on mobile connections.
Second, Remote Objects is JavaScript-based. This makes it natural to use with a variety of mobile frameworks that use JavaScript themselves. We’ll talk more about that in the last unit in this module.

### JavaScript Remoting
JavaScript Remoting is, as you can probably guess from the name, also based in JavaScript. However, where Remote Objects is simple and straightforward, JavaScript Remoting is flexible and powerful. JavaScript Remoting gives you the most capability to create exactly the app experience you want to deliver, and to provide the best performance for those apps. But to do so, you’ll write more code yourself, and you’ll need to master some complex concepts.
