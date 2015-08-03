// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('mouseover', '#posted_books td', function(e) {
	$(this).addClass('selected_cell');
	// Changing book + date cell together
	if ($(this).hasClass('book_cell')) {
		$(this).next().addClass('selected_cell');
	}
	if ($(this).hasClass('date_cell')) {
		$(this).prev().addClass('selected_cell');
	}
}).on('mouseout', '#posted_books td', function(e) {
	$(this).removeClass('selected_cell')
	// Changing book + date cell together
	if ($(this).hasClass('book_cell')) {
		$(this).next().removeClass('selected_cell');
	}
	if ($(this).hasClass('date_cell')) {
		$(this).prev().removeClass('selected_cell');
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