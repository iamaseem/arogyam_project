var firebaseConfig = {
    apiKey: "AIzaSyAs2eHdXYdKVqVdQWA1Wf5HflfFEL3TCyw",
    authDomain: "trial-6ac27.firebaseapp.com",
    databaseURL: "https://trial-6ac27.firebaseio.com",
    projectId: "trial-6ac27",
    storageBucket: "trial-6ac27.appspot.com",
    messagingSenderId: "411426083933",
    appId: "1:411426083933:web:409725a3a4aa49308b69b4",
    measurementId: "G-9BGE3TTWTY"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();

  firebase.auth.Auth.Persistence.LOCAL;


  $("#signin").click(function()
  {
      var email = $("#email").val();
      var password = $("#password").val();
      var result = firebase.auth().signInWithEmailAndPassword(email, password);
      result.catch(function(error)
      {
          var errorcode= error.code;
          var errormessage =error.message;
          console.log(errorcode);
          console.log(errormessage);
          window.alert("Message : "+errormessage);
      });
  });

  googlesignin=()=>{
      base= new firebase.auth.GoogleAuthProvider()
      firebase.auth().signInWithPopup(base).then(function(result)
      {
          console.log("Successful");
      }).catch(function(error)
      {
          console.log(error.code);
          console.log(error.message);
          window.alert("Message : "+error.message);
      })
  }

  $("#signout").click(function()
  {
      firebase.auth().signOut().then(function() {
        window.alert("Sign out successful");
      }).catch(function(error) {
        console.log(error.code);
        console.log(error.message);
        window.alert("Message : "+error.message);
      });
  });
