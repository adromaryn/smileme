$(document).ready(function(){
		$('#posts').on("click", '.pagination a', function () {
				$.get(this.href, null, null, 'script');
				return false;
    });
    $('#comments').on("click", '.pagination a', function () {
				$.get(this.href, null, null, 'script');
				return false;
    });
    $('#posts').on("click", '.like_menu a', function () {
				$.post(this.href, null, null, 'script');
				return false;
    });
});
