function makeHiddenInput(id, name, value, appendDestination){
	return $('<input>').attr({
		id : id,
		type : 'hidden',
		name : name,
		value : value
	}).appendTo(appendDestination);
}

function makeDiv(id, name, style){
	return $('<div>').attr({
		id : id,
		name : name,
		style : style
	});
}