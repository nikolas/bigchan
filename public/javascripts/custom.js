$(document).ready( function() {
	$('#spool_form').draggable ({
		start: function(event, ui) {
			ui.helper.addClass('being_dragged');
		},
		stop: function(event, ui) {
			ui.helper.removeClass('being_dragged');
		}
	});
});
