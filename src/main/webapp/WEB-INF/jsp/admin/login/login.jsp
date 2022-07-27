<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function() {
	
}) 

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log(googleUser);
	  console.log(googleUser.getAuthResponse().id_token);


	/*   $.ajax({
			type: "post",
			url: "/admin/loginProcess",
			datatype:"json",
			data: {"AccessToken":googleUser.getAuthResponse().id_token},
			success:function( data ) {
				   window.location.reload();
			}
		}); */
	  

}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.'); 
    });
  }


function googleLogin(){
	$('#divBtn').click();
}




</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="582641289119-vge5hepgljfbeabh48r6km55iln3s2c9.apps.googleusercontent.com">


<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<body>
    <div id="wrap">
    <div id ="divBtn2"></div>
   	 <div id ="divBtn"  class="g-signin2" data-onsuccess="onSignIn"></div>
			<a href="#" onclick="signOut();">Sign out</a>
    </div><!--e:wrap-->
    
    
    <div class="Df Df_Ac Df_JC Me_Park_All_Box" >
    <div>
      <div>
        <p class="Me_Park">Me.Park</p>
      </div>
      
      
      <div class="cursor" >
      	
        <svg xmlns="http://www.w3.org/2000/svg" class="google_login" viewBox="0 0 1133 225">
          <g id="그룹_181" data-name="그룹 181" transform="translate(-2858 -2142)">
            <g id="사각형_316" data-name="사각형 316" transform="translate(2858 2142)" fill="#fff" stroke="#323232"
              stroke-width="5">
              <rect width="1133" height="225" rx="112.5" stroke="none" />
              <rect x="2.5" y="2.5" width="1128" height="220" rx="110" fill="none" />
            </g>
            <g id="그룹_180" data-name="그룹 180">
              <g id="그룹_179" data-name="그룹 179" transform="translate(2966.5 2197.833)">
                <path id="패스_689" data-name="패스 689"
                  d="M184.95,118.346a48.559,48.559,0,0,0-1.2-11.585h-53.2V127.79h31.229a27.692,27.692,0,0,1-11.585,18.385l-.106.7,16.822,13.032,1.165.116c10.7-9.885,16.874-24.43,16.874-41.682"
                  transform="translate(-73.883 -60.42)" fill="#4285f4" />
                <path id="패스_690" data-name="패스 690"
                  d="M64.547,201.829c15.3,0,28.144-5.037,37.526-13.726L84.192,174.251c-4.785,3.337-11.207,5.667-19.644,5.667A34.114,34.114,0,0,1,32.31,156.37l-.665.056L14.154,169.964l-.229.636a56.626,56.626,0,0,0,50.622,31.23"
                  transform="translate(-7.881 -88.496)" fill="#34a853" />
                <path id="패스_691" data-name="패스 691"
                  d="M24.429,108.232a34.886,34.886,0,0,1-1.889-11.207,36.658,36.658,0,0,1,1.826-11.207l-.032-.751L6.624,71.312l-.579.276a56.547,56.547,0,0,0,0,50.874l18.385-14.229"
                  transform="translate(0 -40.358)" fill="#fbbc05" />
                <path id="패스_692" data-name="패스 692"
                  d="M64.547,21.911a31.406,31.406,0,0,1,21.911,8.437l15.993-15.615A54.444,54.444,0,0,0,64.547,0,56.625,56.625,0,0,0,13.925,31.229l18.322,14.23a34.254,34.254,0,0,1,32.3-23.548"
                  transform="translate(-7.881 0)" fill="#eb4335" />
              </g>
              <text id="구글_계정으로_간편_로그인하기" data-name="구글 계정으로 간편 로그인하기" transform="translate(3108.5 2279)" fill="#323232"
                font-size="60" font-family="S-CoreDream-5Medium, 'S-Core Dream \35 '" font-weight="500"
                letter-spacing="-0.03em">
                <tspan x="0" y="0">구글 계정으로 간편 로그인하기</tspan>
              </text>
            </g>
          </g>
        </svg>
      </div>
    </div>
  </div>
    
    
    
</body>

