$(document).on('turbolinks:load', function(){
	$('.toggle-premium-link').on('ajax:success', function(e, data, status, xhr){
		$(this).html(data)
	})

	$('.tatoo-link').on('click', function(){
		$('.preview').attr('src', $(this).data('url'))
	})
})