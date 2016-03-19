$(document).ready(function(){
  $("#notice > .close").click(function() {
    $("#notice").hide();
  });
  $("#error > .close").click(function() {
    $("#error").hide();
  });
  $("#posts").on("click", ".post .close" ,function(e) {

    var url = "/posts/id"+$(this).data("id")
  	$.ajax({
  		url: url,
  		type: 'DELETE',
  		context: this,
  	  success: function() {
  	  	$(this).parents('.post').remove();
  	  }
  	});
  	return false;
  });
  $("#comments").on("click", ".comment .close" ,function(e) {

    var url = "/comments/id"+$(this).data("id")
  	$.ajax({
  		url: url,
  		type: 'DELETE',
  		context: this,
  	  success: function() {
  	  	$(this).parents('.comment').remove();
  	  }
  	});
  	return false;
  });
});

