let ready = () => {
  return new Promise((resolve, reject) => {
    document.addEventListener('readystatechange', function() {
      if (document.readyState == 'complete') {
        resolve()
      }
    })
  })
}
