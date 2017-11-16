# <b>Zlatni Covjek</b> :bank:

## Debugging Javascript
* [How to display History Related lists in descending order in Visualforce?](https://developer.salesforce.com/forums/?id=906F000000096u9IAA)
* [Console API](https://developer.mozilla.org/en-US/docs/Web/API/console)
* [Debugging JavaScript](https://developer.mozilla.org/en-US/docs/Mozilla/Debugging/Debugging_JavaScript)
* [Comparing the contents of two files in Sublime Text](https://stackoverflow.com/questions/25874018/comparing-the-contents-of-two-files-in-sublime-text)

`<c:MobileComponent />` - Custom Vf component written by Jim.  Its purpose is to hide all incompatible components from mobile version of notes and also to convert all UI elements to render properly in mobile.  In new notes it is not required as the new notes use responsive dash UI.

`<c:GsUIFix />` - custom component that has to be used on any page that uses the new responsive UI.  The new UI messes up the top half of Salesforce page (the area where your name is written and org logo is present.  This component prevents that from happening.  This must be included in the new UI code.

## CSS
*

### External Style Sheet
```css
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
```
```css
body {
    background-color: lightblue;
}

h1 {
    color: navy;
    margin-left: 20px;
}
```
### Internal Style Sheet
```css
<head>
<style>
body {
    background-color: linen;
}

h1 {
    color: maroon;
    margin-left: 40px;
} 
</style>
</head>
```
### Inline Style Sheets
```css
<h1 style="color:blue;margin-left:30px;">This is a heading</h1>
```

### Multiple Style Sheets
* If some properties have been defined for the same selector (element) in different style sheets, the value from the last read style sheet will be used. 

```css
/* If the internal style is defined after the link to the external style sheet, 
the <h1> elements will be "orange": */

<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style>
h1 {
    color: orange;
}
</style>
</head>
```
```css
/* if the internal style is defined before the link to the external style sheet, 
the <h1> elements will be "navy": */

<head>
<style>
h1 {
    color: orange;
}
</style>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
```
#### Cascading Order
What style will be used when there is more than one style specified for an HTML element?

Generally speaking we can say that all the styles will "cascade" into a new "virtual" style sheet by the following rules, where number one has the highest priority:

1. Inline style (inside an HTML element)
2. External and internal style sheets (in the head section)
3. Browser default

So, an inline style (inside a specific HTML element) has the highest priority, which means that it will override a style defined inside the <head> tag, or in an external style sheet, or a browser default value.

### Apex
`get` and `set` are accessors, meaning they're able to access data and info in private fields (usually from a backing field) and usually do so from public properties

### Workflow Rules
