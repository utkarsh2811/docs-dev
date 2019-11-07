# Client-side API overview

## Customization for Web

This guide explains how to interact with the Intempt JavaScript API.

### JS Overview

When you add the default tracker code to a website, it handles tracking and notifications automatically. This allows for a completely plug-and-play experience.

The tracker code also exposes an API allowing you to:

- attach identifying or other data to visitor records
- log custom events
- customize the display of notifications

### Tracker Code

```shell
window.addEventListener("intempt.YOUR_TRACKER_NAME.ready", function() {
  //do something when tracker has been loaded;
  //the tracker object becomes accessible at window.intempt["site"] after loading;
});
!function(a,b){if(window.__intempt&&window.intempt)a&&(window.__intempt.init_tracker?window.__intempt.init_tracker(a):window.__intempt.startup_configs.push(a));else{window.__intempt={},window.__intempt.startup_configs=[],a&&window.__intempt.startup_configs.push(a);var c=document.createElement("script");c.type="text/javascript",c.async=!0,c.src=b||"https://cdn.intempt.co/intempt.min.js";var d=document.getElementsByTagName("script")[0];d.parentNode.insertBefore(c,d)}}({orgId:"YOUR_ORG_NAME",trackerId:"YOUR_TRACKER_NAME",token:"YOUR_TRACKER_TOKEN"});
```

Add the following code to your site, preferably in the `<head>`.

You can get an automatically generated version of this code, with your account-specific variables filled in, from the tracker setup page in the Intempt app.


### Tracker Object

The tracker object is accessible with:

`window.intempt["TRACKER_NAME"]`

The `TRACKER_NAME` string is the name as specified in the Intempt app.


```shell
if (window.intempt && window.intempt['YOUR_TRACKER_NAME']) {
  // Perform your tracker operations here
}
```
<aside class="warning">The tracker object does not exist until initialization completes. Therefore you should check its existence before running any custom tracking code.
</aside>

### Identifying Visitors

```shell
window.intempt["TRACKER_NAME"].identify({
    identifier: 'CUSTOM_IDENTIFIER'
})
```

Our tracking code automatically sets a unique ID for each visitor, and attempts to link multiple visits to the same visitor by setting a cookie in the browser.

To track visitors across multiple browsers and apps (or sessions after cookies are removed), pass in a unique identifying code (user email, unique user ID in your database etc.).

You can pass additional key-value pairs to `identify`, but `identifier` is the one that defines a unique identity. Other key-value pairs passed in can be used for data queries and segmenting in the Intempt app.

### Tracking Categories and Products

Visitor activity on the page can be scoped by introducing categories and products. This might come in handy when, for instance, you would like to understand differences between visitor activities for different categories or products pages, or when you simply want to know for notification purposes, which is the current one.

All you need to track categories and products is changing the tracked JS variables - our tracker will create the context and persist it automatically. You can either set both, or set one of them:

```shell
window.intempt_category = 'my-category'; // sets the category for current page
window.intempt_product = 'my-product'; // sets the product for current page
```

To reset category and product, simply purge values from these variables (if your website is multi-page application, that is done automatically upon page transition):

```shell
window.intempt_category = undefined; // sets the category for current page
window.intempt_product = undefined; // sets the product for current page
```

&nbsp;

You can also use Object to track some additional properties both for categories and for products. In such case the requirement is that this object must contain field name with string in it, like this:

```shell
window.intempt_category = {
    name: 'my-category', // required field, must contain string
    property1: 'some value 1',
    property2: 'some value 2'
};
window.intempt_product = {
    name: 'my-product', // required field, must contain string
    property1: 'some value 1',
    property2: 'some value 2'
};
```
&nbsp;

You also can create events for visitors actions, that cause changes to categories and products using `Custom` action type, and in subsequent menu picking `category_changed` or `product_changed`.

&nbsp;

### Recording Custom Events

Our client-side API allows creation of any event type you might desire to be tracked for your page or application.

Custom collections was designed to allow you bring custom data into some Intempt-built event collections (like Visitor, Visit, Identify) and bring in your own collections.

After you select this event type, next to it you can see a dropdown list with all the collections, that have not been covered by our other event types. After a collection has been selected, by clicking Filter button you can add filters for and of the properties that you (or we for Intempt-defined collections) might have tracked for this collection.

Intempt automatically tracks a number of on page events. You can log a custom event by calling `track`, passing in a set of key-value pairs.

```shell
window.intempt["TRACKER_NAME"].track("COLLECTION_NAME", {
    "your.property": "your value"
})
```

The `COLLECTION_NAME` refers to an event type. For example, if you wanted to log every purchase made on your site, you might call that collection `"purchase"`. Then, when a purchase happens, you call `track` and pass in the purchase details.

```shell
window.intempt["YOUR_TRACKER_NAME"].track("purchase", {
     "items": [{"item name": "item 1","price": 20}, {"item name": "item 2","price": 15}]
     "totalprice": 35,
     "ispaid": true,
     "timestamp": new Date().getTime(),
     "fixed.name": "John Smith",
     "fixed.age": 28,
     "intempt.visit.trackcharge": 35
})
```

### Tracking Revenue with trackcharge

Notice the key `intempt.visit.trackcharge` in the sample code above. If you use this key in the event details, the value will be recorded as revenue in the Intempt app. This allows you to assess the revenue impact of campaigns.

Collections do not need to be predefined in the Intempt app. As soon as the tracker logs an event with a new collection name, that collection of events will be available in the app.

## Events, Collections, and Properties

An event is a discrete interaction that occurs on your site. Events are organized by type into collections. Events have properties, key-value pairs that record relevant information about the event.

For example, a user clicks on a link:

- The click is an event.
- It belongs to the interactions collection. (The interaction type is “click”.)
- The properties of the event include the time of the click, the id and other HTML attributes of the element that was clicked, the URL of the page on which the click happened, and so forth.

The tracker code, once installed on a website, will automatically record many events that occur on the site.

## Tracker Events
<aside class="warning">Events as recorded by the tracker code are conceptually somewhat different than events as defined in the Intempt app.</aside>

On the JS side, events will soon be renamed to actions.

Event collections are organized in a tree structure.

- visit
    - visitor
    - page
        - interaction
        - page_element_exists
        - page_element_changed
        - page_property_changed
        - category_changed
        - product_changed
    - identify
    - view
        - interaction
    - custom

Because of this hierarchy, any event can be filtered or accessed based on the properties associated with something further up the tree.

For example, if you wanted to find all button clicks associated with a particular visit, you can do that.

Custom events logged manually using the JavaScript API appear with whatever collection name was assigned, under the custom collection.

## Properties

Events have properties, key-value pairs the record information about the event.

Properties are grouped into two collections:

- fixed — Properties that are (relatively) stable, related to the visit or the visitor. This includes things like operating system, browser, and geolocaiton.
- timeseries — Properties that are specific to a particular interaction. This includes element-specific details, time stamps, and anything recorded as part of custom events.

<aside class="success">When logging a custom event, you can pass in any existing property key names, as well as define your own.</aside>
