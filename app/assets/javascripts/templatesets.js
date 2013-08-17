$( function() {

	function incrementAttr(str)
	{
		var regexp = new RegExp('(\\D+)(\\d+)(\\D+)');
		var r = regexp.exec(str);
		console.log(str);
		console.log(r);
		return r[1] + (parseInt(r[2], 10) + 1) + r[3];
	}

	$('#newbutton').click(function(){
		var last_field = $('#format_fields').children().last();
		var new_field = last_field.clone()
		new_field.appendTo($('#format_fields'));
		new_field.children('label').attr('for', incrementAttr(
			new_field.children('label').attr('for')));
		new_field.children('input').each(function(){
			if( $(this).attr('id') ){
				$(this).attr('id', incrementAttr($(this).attr('id')));
			}
			if( $(this).attr('name') ){
				$(this).attr('name', incrementAttr($(this).attr('name')));
			}
		});
		new_field.children('input[type=hidden]').val(0);
		new_field.show();

	});

	$(".deletebutton").click(function(){
		$(this).next().val(1);
		$(this).parent().hide();
	});
}
);
