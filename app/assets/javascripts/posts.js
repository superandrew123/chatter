// Ajax for posts on main page

function newPost(){
	$(".new_post").on("submit", function(e){
		e.preventDefault();
		e.stopPropagation();
		var form = $(this)
		var data = form.serialize();
		var url = form.attr("action");
		var method = form.attr("method");
		$.ajax(url, {
			method: method,
			data: data,
			dataType: 'script'
		})
	})
};


	// var url = form.attr("action");
	// var method = form.attr("method");