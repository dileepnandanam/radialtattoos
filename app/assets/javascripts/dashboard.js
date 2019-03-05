$(document).on('turbolinks:load', function(){

	$('.tatoo-dashboard-items').sortable()
	$('.tatoo-dashboard-items').sortable({
		stop: function() {
			$.ajax({
				data: $('.tatoo-dashboard-items').sortable('serialize'),
				method: 'PUT',
				url: '/tatoos/reorder'
			})
		}
	})
})