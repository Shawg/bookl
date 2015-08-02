// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('mouseover', 'td', function(e) {
	$(this).css({ 'background-color': '#f3f3f3'});
	if ($(this).hasClass('book_cell')) {
		$(this).next().css({ 'background-color': '#f3f3f3'});
	}
	if ($(this).hasClass('date_cell')) {
		$(this).prev().css({ 'background-color': '#f3f3f3'});
	}
}).on('mouseout', 'td', function(e) {
	$(this).css({ 'background-color': 'white'});
	if ($(this).hasClass('book_cell')) {
		$(this).next().css({ 'background-color': 'white'});
	}
	if ($(this).hasClass('date_cell')) {
		$(this).prev().css({ 'background-color': 'white'});
	}
}).on('click', 'td', function(e) {
	var link;
	if (($(this).hasClass('book_cell')) || ($(this).hasClass('date_cell')))
		window.location.href = $(this).closest('tr').find('.book_cell a').attr('href');
	else if ($(this).hasClass('destroy_cell'))
		$(this).find('a').click();
	else if ($(this).hasClass('edit_cell') || $(this).hasClass('active_cell'))
		var link = $(this).find('a').attr('href');
		if (link)
			window.location.href = link;
});