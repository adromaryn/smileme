$(document).ready(function(){
	$('.ava-submit').hide();
  $('#avatar + img').click(function(e) {
  		$('#avatar').trigger('click');
  });
  
	$('#avatar').change(function(e) {
	  $('.ava-submit').show();
  });
  
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
  if ($("#about").length) {
    GetAbout();
  }
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
  	url = location.protocol + '//' + location.host + location.pathname + '/about'
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(data) {
      	$("pre#about").append(data.about);
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
    	console.log($(e.target).parents('.ava-submit'));
      $('.ava-submit').hide();
    }
  });
  $('.inputfile').change(function(e) {
  		str = $('.inputfile').val();
  		if (str.length > 15) {
  			str = str.slice(0,12)+"...";
  		}
  		$('.inputfile + label').text(str);
  });
});
