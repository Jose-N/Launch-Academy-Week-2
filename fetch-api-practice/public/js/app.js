
fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    }else {
      let errorMessage = `${response.status} (${response.statusText})`, error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    console.log(body);
    let booksUl = document.getElementById('books');
    body['books'].forEach(function(bookHash) {
      let liElement = document.createElement('li');
      liElement.innerHTML = `${bookHash['name']}`;
      booksUl.appendChild(liElement);
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.meessage}`));
