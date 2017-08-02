## Apply your understanding of fetch and JQuery

Now that you have become familiar with some of the utility of fetch, build on the work you did during the [ES6 Fetch API](https://learn.launchacademy.com/lessons/es6-fetch-api) walkthrough. Note: you will want to start with the files and code found in your `ES6 Fetch API` directory to complete this exercise.

## Instructions:

* After fetching data from `books.json`, create a new list item for each book title.
* Append each list item to the unordered list on the index page.

## Tips

JQuery has already been loaded into the layout script, so feel free to use jQuery to append items to the page.

```javascript
// app.js
// change the following code to append list elements for each book
fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.text())
  .then(body => {
    console.log(body);
    let bodyParsed = JSON.parse(body);
    console.log(bodyParsed);
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
```
