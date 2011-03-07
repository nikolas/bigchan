$(document).ready( function() {
	$('#spool_form').draggable ({
		scroll: false,
		start: function(event, ui) {
			ui.helper.addClass('being_dragged');
		},
		stop: function(event, ui) {
			ui.helper.removeClass('being_dragged');
		}
	});
});
