// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('click', '.result', function(e) {
	// navigate to books/show/:id when clicking table row
	window.location.href = ($(this).find('a').attr('href'));
}).on('click', '.contact-info', function(e) {
	// Hidden contact info
	e.preventDefault();
	email = $(this).data('email');
	$(this).text(email);
	$(this).attr('href', "mailto:" + email);
	$(this).removeClass('contact-info');
}).on('click', '.btn-remove', function(e) {
	e.preventDefault();

	// Removing courses/authors input (edit view)
	$(this).closest('.form-inline').find('input[type=hidden]:first').val(1);
	console.log($(this).closest('.form-inline').find('input[type=hidden]:first'));
	$(this).closest('.form-inline').hide();

}).on("click", ".link_to_add_fields", function(e){
	// Adding authors/courses
	e.preventDefault();

	var link = $(this).closest('.dynamic_inputs').next().find('.hidden_fields_link');
	var association = link.data("association");
	var content = link.data("content");
	var controlForm = $(this).closest('.dynamic_inputs');

	add_fields(link, association, content, controlForm);
	set_button_icons(controlForm);
});

function add_fields(link, association, content, form) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	form.append(content.replace(regexp, new_id));
}

function set_button_icons(controlForm) {
	controlForm = $(controlForm);
	controlForm.find('.form-inline:not(:last) span button')
		.removeClass('link_to_add_fields')
		.addClass('btn-remove')
		.html('<span class="glyphicon glyphicon-minus"></span>');
	controlForm.find('.form-inline:last span button')
		.removeClass('btn-remove')
		.addClass('link_to_add_fields')
		.html('<span class="glyphicon glyphicon-plus"></span>');
}

// Dynamic height for textarea
$(document).on('ready page:load', function () {

	$('.container').find('.dynamic_inputs').each(function(index, elm) {
		set_button_icons(elm);
	});

	var observe;

	if (window.attachEvent) {
	    observe = function(element, event, handler) {
	    	element.attachEvent('on'+event, function() {
	    		handler(element);
	    	});
	    }
	} else {
	    observe = function(element, event, handler) {
	    	element.addEventListener(event, function() {
	    		handler(element);
	    	}, false);
	    }
	}

    var resize = function(elm) {
	    elm.style.height = 'auto';
	    elm.style.height = elm.scrollHeight+'px';
	}

    // 0-timeout to get the already changed text 
    var delayedResize = function(elm) {
        window.setTimeout(resize(elm), 0);
    }
  	
  	setObservers = function(elm) {
  		observe(elm, 'change',  resize);
  		observe(elm, 'cut',     delayedResize);
  		observe(elm, 'paste',   delayedResize);
  		observe(elm, 'drop',    delayedResize);
		observe(elm, 'keydown', delayedResize);
	}

	var elms = document.getElementsByClassName('dynamic_height');
	for (var i = 0; i<elms.length; i++) {
		var elm = elms[i];
		setObservers(elm);
		elm.focus();
		elm.select();
		resize(elm);
	}
});