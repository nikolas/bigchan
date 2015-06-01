$(document).ready( function() {
	$('#spool_form, .floating').draggable({
		handle: '.tool',
		scroll: false
	});
});

function popUpCentered( popW, popH, popupName, popupUrl ) {
	var winLeft = (screen.width - popW) / 2;
	var winUp = (screen.height - popH) / 4;
	var popup = window.open( popupUrl, popupName, 'left=' + winLeft + ', top=' + winUp + ', height=' + popH + ', width=' + popW + ', scrollbars=no, resizable=yes, toolbar=no, screenX=0, screenY=0, status=no');
	popup.resizeTo(popW, popH);
	popup.moveTo(winLeft,winUp);
	popup.focus();
}

function popUpPlayer(urlJs) {
	popUpCentered( 620, 460, 'Player', urlJs );
}

function play( stationId, programId, segmentId, streamId, forcePopup, forcePlay) {
	var command = 'http://tunein.com/' + "tuner/?";
	if( forcePlay )
	{
		command = command + "IgnoreStreams=1&";
	}

	if( 0 != stationId )
		command += "StationId=" + stationId + "&";
	if( 0 != programId )
		command += "ProgramId=" + programId + "&";
	if( 0 != segmentId )
		command += "TopicId=" + segmentId + "&";
	if( 0 != streamId )
		command += "StreamId=" + streamId;

	popUpPlayer( command );
}
