<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log(googleUser);
	  console.log(googleUser.getAuthResponse().id_token);

	}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="582641289119-vge5hepgljfbeabh48r6km55iln3s2c9.apps.googleusercontent.com">
<body>
    <div id="wrap">
   	 <div class="g-signin2" data-onsuccess="onSignIn"></div>
			<a href="#" onclick="signOut();">Sign out</a>
    </div><!--e:wrap-->
</body>

