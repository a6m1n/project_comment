





  window.fbAsyncInit = function() {
    FB.init({
      appId      : '2392552961029996',
      cookie     : true,
      xfbml      : true,
      version    : 'v3.3'
    });

      FB.getLoginStatus(function(response) {
          statusChangeCallback(response);
          if_user_connect(response);
      });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   function statusChangeCallback(response){
     console.log(response);
     FB.api('/me?fields=name,email',function(response1){
        console.log(response1);
        if_user_connect(response,response1)

      })
   }


  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      FB.api('/me?fields=name,email',function(response){
        console.log(response);
      })
    });
  }

  function logout(){
    FB.logout();
    document.getElementById('fbButtonLogin').style.display = 'block';
    document.getElementById('if_true').style.display = 'none';


  }

  function if_user_connect(response,response1='False'){
    if (response.status == 'connected'){
     document.getElementById('fbButtonLogin').style.display = 'none';
     document.getElementById('if_true').style.display = 'block';
     document.getElementById('name_user').innerHTML = response1.name;
     document.getElementById('id_user').innerHTML = response1.id;
    }
    else{
      document.getElementById('fbButtonLogin').style.display = 'block';
      document.getElementById('if_true').style.display = 'none';

    }
  }

  function send_data(response,response1){
    name=response1.name;
    id=response1.id;
    console.log('Your name = ', name);
    console.log('Your id = ', id);
  }

















// 2392552961029996
// 618209895325324
// 605401409963508







// window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '605401409963508',
//       cookie     : true,
//       xfbml      : true,
//       version    : 'v3.3'
//     });

//       FB.getLoginStatus(function(response) {

//           statusChangeCallback(response);
//       });
//   };

//   (function(d, s, id){
//      var js, fjs = d.getElementsByTagName(s)[0];
//      if (d.getElementById(id)) {return;}
//      js = d.createElement(s); js.id = id;
//      js.src = "https://connect.facebook.net/en_US/sdk.js";
//      fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

//    function statusChangeCallback(response){
//      console.log(response);
//    }


//   function checkLoginState() {
//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//       FB.api('/me?fields=name,email',function(response){

//         console.log(response);
//       })
//     });
//   }

//   function logout(){

//     FB.logout()}







//   window.fbAsyncInit = function() {
//     FB.init({
//       appId      : '605401409963508',
//       cookie     : true,
//       xfbml      : true,
//       version    : '{api-version}'
//     });
      
//     FB.AppEvents.logPageView();
//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//     });   
      
//   };

//   (function(d, s, id){
//      var js, fjs = d.getElementsByTagName(s)[0];
//      if (d.getElementById(id)) {return;}
//      js = d.createElement(s); js.id = id;
//      js.src = "https://connect.facebook.net/en_US/sdk.js";
//      fjs.parentNode.insertBefore(js, fjs);
//    }(document, 'script', 'facebook-jssdk'));

//   function checkLoginState() {
//     FB.getLoginStatus(function(response) {
//       statusChangeCallback(response);
//   });
// }
// function logout(){FB.logout()}



// <script>
//     window.fbAsyncInit = function() {
//       FB.init({
//         appId      : '605401409963508',
//         cookie     : true,
//         xfbml      : true,
//         version    : 'v3.3'
//       });

//         FB.getLoginStatus(function(response) {
//             statusChangeCallback(response);
//         });
         
//     };

//     (function(d, s, id){
//        var js, fjs = d.getElementsByTagName(s)[0];
//        if (d.getElementById(id)) {return;}
//        js = d.createElement(s); js.id = id;
//        js.src = "https://connect.facebook.net/en_US/sdk.js";
//        fjs.parentNode.insertBefore(js, fjs);
//      }(document, 'script', 'facebook-jssdk'));

//      function statusChangeCallback(response){
//        console.log(response);
//      }
//      function checkLoginState() {
//         FB.getLoginStatus(function(response) {
//           statusChangeCallback(response);
//           FB.api('/me?fields=name,email',function(response){
//             console.log(response);
//         })
//       });
//     }    
//   </script>
