# <i>Zlatni Covjek</i> :man:

## Debugging Javascript
* [How to display History Related lists in descending order in Visualforce?](https://developer.salesforce.com/forums/?id=906F000000096u9IAA)
* [Console API](https://developer.mozilla.org/en-US/docs/Web/API/console)
* [Debugging JavaScript](https://developer.mozilla.org/en-US/docs/Mozilla/Debugging/Debugging_JavaScript)
* [Comparing the contents of two files in Sublime Text](https://stackoverflow.com/questions/25874018/comparing-the-contents-of-two-files-in-sublime-text)


## CSS

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
```
