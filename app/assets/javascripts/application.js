// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function loadStateList() {
	var state_select = $("#select-state");
	$.getJSON('/cities/' + $("#select-country").val(), function (data) {
		state_select.empty();
		var opt = '<option value=>select a area</option>';
		state_select.append(opt);
		$.each(data, function (i) {
			if (data[i].id == current_state) {
				var opt = '<option selected value='+ data[i].id +'>' + data[i].name + '</option>';
			} else {
				var opt = '<option value='+ data[i].id +'>' + data[i].name + '</option>';
			}
			state_select.append(opt);
		});
	});
}

$(document).on('turbolinks:load', function() {
	var hide_btn = 'show';
	$('select').select2();
	$('a#hide-had-btn').text("Hide Drinks I've Had");

	$('a.back-btn').click(function(){
		parent.history.back();
		return false;
	});
	
	$('a#hide-had-btn').click(function(){
		if (hide_btn == 'hide') {
			hide_btn = 'show';
			$(this).text("Hide Drinks I've Had");
			$('.drink-had').show();
		} else {
			hide_btn = 'hide';
			$(this).text("Show Drinks I've Had");
			$('.drink-had').hide();
		}
		return false;
	});	
	
	$('a.btn-toggle-switch').click(function(){
		var toggle1 = $(this).data('toggle1');
		var toggle2 = $(this).data('toggle2');
		$("#" + toggle1).toggle();
		$("#" + toggle2).toggle();
		return false;
	});
	
	
	$('a.btn-toggle').click(function(){
		var note_id = $(this).data('id');
		$("#show-form-note-" + note_id).toggle();
		$("#edit-form-note-" + note_id).toggle();
		return false;
	});
	
	$('a.toggle-notes').click(function(){
		$("#your-notes").toggle();
		$("#global-notes").toggle();
		return false;
	});
	
});
