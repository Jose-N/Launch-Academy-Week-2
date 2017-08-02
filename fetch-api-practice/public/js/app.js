
fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    }else {
      let errorMessage = `${response.status} (${response.statusText})`, error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.text())
  .then(function(body) {
    let jsonBody = JSON.parse(body);
    console.log(jsonBody);
    let booksUl = document.getElementById('books');
    jsonBody['books'].forEach(function(bookHash) {
      let liElement = document.createElement('li');
      let book = document.createTextNode(bookHash['name']);
      booksUl.appendChild(liElement.appendChild(book));
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.meessage}`));
