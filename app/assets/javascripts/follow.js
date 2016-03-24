$(document).ready(function(){
		$('main').on("click", '.follow', function () {
				var url = window.location.href  + '/follow';
				$.post(url, null, function(){
						$('span.follow').replaceWith(function(){
								return $("<span class='unfollow'>−</span>" );
						});
				},
				'script');
				return false;
    });
		$('main').on("click", '.unfollow', function () {
				var url = window.location.href  + '/unfollow';
				$.post(url, null, function(){
						$('span.unfollow').replaceWith(function(){
								return $("<span class='follow'>+</span>");
						});
				},
				'script');
				return false;
    });
		$('#follows').on("click", '.pagination a', function () {
				$.get(this.href, null, null, 'script');
				return false;
    });
});
