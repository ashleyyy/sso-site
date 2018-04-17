$(document).ready(function() {

  $('#signout').on("click", function () {
    console.log('in signout onclick')
    $.get( "https://yoursite.thinkific.com/users/sign_out" )
  })


});
