$(document).ready(function(){
	$('.ava-submit').hide();
  $('#avatar-image').click(function(e) {
  		$('#avatar').trigger('click');
  });
  
	$('.changeable form').on("change", '#avatar', function(e) {
	  $('.ava-submit').show();
  });
  
  if ($("#login-text").length) {
    GetLogin();
  }
  
  $(".changeable > #login-form").hide();
  
  $(".changeable > #login-text").click(function(e) {
    $(".changeable > #login-text").hide();
    $(".changeable > #login-form").show();
    $(".changeable #login").focus();
  });
  function SetLogin(){
  	var str=$(".changeable #login").val();
    $.ajax({
      type: "POST",
      url: '/users/login',
      data: {"login":str},
      dataType: "json",
      success: function(data) {
      	$(".changeable > #login-text").text(data.login);
      	$(".changeable > #login-form").hide();
        $(".changeable > #login-text").show();
      }
    });
  }
  function GetLogin(){
  	var url = location.protocol + '//' + location.host + location.pathname + '/login';
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(data) {
      	$("#login-text").html(data.login);
      	$(".changeable #login").val(data.login);
      }
    });
  }
  if ($("#about-text").length) {
    GetAbout();
  }
  $(".changeable > #about-form").hide();
  
  $(".changeable > #about-text").click(function(e) {
    $(".changeable > #about-text").hide();
    $(".changeable > #about-form").show();
    $(".changeable > #about-form textarea").focus();
  });
  
  function GetAbout(){
  	var url = location.protocol + '//' + location.host + location.pathname + '/about';
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(data) {
      	$("#about-text").html(data.about);
      	$("#about-form textarea").val(data.about);
      }
    });
  }

  $(".new-post").hide();
  $("#new-pic-button").click(function(e) {
  		$(".new-post").hide();
  		$("#new-pic").show();
  });
  
  $("#new-video-button").click(function(e) {
  		$(".new-post").hide();
  		$("#new-video").show();
  });
  
  $("body").click( function(e){
    if($(e.target).parents('.download-button').length != 1 && 
            e.target.className != "download-button" &&
            $(e.target).parents('.new-post').length != 1 &&
            e.target.className != "new-post")
    {
      $('.new-post').hide();
    }
    if($(e.target).parents('.ava-submit').length != 1 && 
            e.target.className != 'ava-submit')
    {
      $('.ava-submit').hide();
    }
  });
  	
  if (! $(".pagination a").length) {
  	$(".pagination").hide();
  }
});
