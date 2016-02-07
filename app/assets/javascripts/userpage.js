$(document).ready(function(){
  $(".changeable > #login-form").hide();
  
  $(".changeable > #login").click(function(e) {
  	str = $(".changeable > #login").text();
  	str = str.replace(/\s+/g, '');
  	$(".changeable > #login-form input").val(str);
    $(".changeable > #login").hide();
    $(".changeable > #login-form").show();
    $(".changeable > #login-form input").focus();
  });
  $(".changeable > #login-form input").keydown(function() {
    $(".changeable > #login-form input").val($(".changeable > #login-form input").val().replace(/\s+/g,''));
  });
  $(".changeable > #login-form input").focusout(function() {
    SetLogin();
  });
  function SetLogin(){
  	str=$(".changeable > #login-form input").val();
    $.ajax({
      type: "POST",
      url: '/users/login',
      data: {"login":str},
      dataType: "json",
      success: function(data) {
      	$(".changeable > #login").text(data.login);
      	$(".changeable > #login-form").hide();
        $(".changeable > #login").show();
      }
    });
  }
  GetAbout();
  $(".changeable > #about-form").hide();
  
  $(".changeable > #about").click(function(e) {
    $(".changeable > #about").hide();
    $(".changeable > #about-form").show();
    $(".changeable > #about-form textarea").focus();
  });
  $(".changeable > #about-form textarea").focusout(function() {
    SetAbout();
  });
  function SetAbout(){
  	str=$(".changeable > #about-form textarea").val();
    $.ajax({
      type: "POST",
      url: '/users/about',
      data: {"about":str},
      dataType: "json",
      success: function(data) {
      	$(".changeable > #about").text(data.about);
      	$(".changeable > #about-form").hide();
        $(".changeable > #about").show();
      }
    }); 
  }
  function GetAbout(){
    $.ajax({
      type: "GET",
      url: '/about',
      dataType: "json",
      success: function(data) {
      	$(".changeable > pre#about").append(data.about);
      	$(".changeable > #about-form textarea").val(data.about);
      }
    });
  }
});
