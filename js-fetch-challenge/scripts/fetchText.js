ready().then(() => {
  pages = document.getElementsByClassName('page')
  console.log(pages)
  Array.from(pages).forEach(function(page) {
    page.addEventListener('click', function() {
      event.preventDefault()
      fetch(this.getAttribute('href'))
      .then(response => { 
        if (response.ok) {
          return response.text()
        }else {
	        let errorMessage = `${response.status} (${response.statusText})`,
	          error = new Error(errorMessage);
	        throw(error);
        }
      })
      .then(text => {
        console.log(text)
        document.getElementById('main').innerHTML = text;
      })
    })
  })
})
