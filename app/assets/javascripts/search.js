$(document).ready(function(){
		$('header .search').focus(function(){
				$('header .search').css('background-image', 'none');
		});
		$('body').click(function(e){
				if($(e.target).parents('header .search').length != 1 && 
					!(e.target.className == "search" || 
						$(e.target).parents('header .search').length == 1) &&
          $(e.target).parents('#qsearch-res').length != 1 &&
          e.target.id != "qsearch-res") {
            $('#qsearch-res').remove();
				    $('header .search').val("");
				    $('header .search').css('background-image', 'url(/assets/search.png)');
				}
		});
		
		$('header .search').keyup(function(){
				var search = $('header .search').val();
				$.get({
					url: '/search/quick',
					data: {"search": search},
					success: function(data){
						var ids = data.ids;
						var users = data.users;
						var avatars = data.avatars;
						if (! $('#qsearch-res').length){
						  $('header').after('<div id="qsearch-res"></div>');
					  }
					  var position = $('header .search').offset();
					  position.top += $('header .search').outerHeight(false);
					  $('#qsearch-res').offset(position);
					  $('#qsearch-res').empty();
					  $('#qsearch-res').width($('header .search').outerWidth(false))
					  $('#qsearch-res').append('<p><strong>Users</strong></p>');
					  if (!users.length) {
					  	$('#qsearch-res').append('<p>Users not found</p>');
					  }
					  var userStr;
					  for (var i = 0; i < users.length; i++){
					  	userStr = '<a href="/users/' + ids[i] + '"><img src="' + 
					      avatars[i] +'"><span>'+users[i] +'</span></a>'
					  	$('#qsearch-res').append(userStr);
					  }
					}
			  });
		});
});
