 childList = (document.getElementById("ExternalAuth").children);
  for (child in childList) {
    innerElement = (document.getElementById("ExternalAuth").children[child]);
    if (innerElement.tagName == 'A') {
      if (innerElement.innerHTML == "Sign in with Facebook") {
        innerElement.className = "btn btn-facebook "
        innerElement.id = "facebook-Auth"
        innerElement.innerHTML = "Login with facebook"
        innerFrame = document.createElement("i")
        innerFrame.className = "fab fa-facebook-f"
        innerElement.appendChild(innerFrame)
        
      }
      else if(innerElement.innerHTML == "Sign in with GoogleOauth2") {
        innerElement.className = "btn btn-google "
        innerElement.id = "google-Auth"
        innerElement.innerHTML = "Login with google"
        innerFrame = document.createElement("i")
        innerFrame.className = "fab fa-google mr-2"
        innerElement.appendChild(innerFrame)
      }
    }
  }
