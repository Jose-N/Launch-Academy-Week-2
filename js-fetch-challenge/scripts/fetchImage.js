ready().then(() => {
  fetch('/images/logo.png')
  .then(response => {
	    if (response.ok) {
        console.log('response ok')
	      return response.blob();
	    } else {
	      let errorMessage = `${response.status} (${response.statusText})`,
	          error = new Error(errorMessage);
	      throw(error);
	    }
	  })
	  .then(blob => {
      console.log('blob ok')
      let imageURL = URL.createObjectURL(blob)
      let imageElement = document.createElement('img')
      imageElement.src = imageURL
      document.getElementById('main').appendChild(imageElement)
	  })
	  .catch(error => console.error(`Error in fetch: ${error.message}`));
})
