$(function() {
	$('.page_part .wym_area_bottom').each(function() {
		$(this).prev('.wym_box').append($(this));
	});
});