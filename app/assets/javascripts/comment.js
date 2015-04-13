// ajax for making comments on a post on the main page
// keep "reply button" until clicked, then show input form

function newComment(){
	// make a listener for reply that replaces reply with a new form
	$(".commentButton").on("click", changeReply);
};

function changeReply(e){
	e.preventDefault();
	e.stopPropagation();
	var url = $(this).attr("href")
	$.ajax(url, {
		method: "GET",
		dataType: "script"
	})
}
function createComment(e){
	e.preventDefault();
	e.stopPropagation();
	var form = $(this);
	var data = form.serialize();
	var url = form.attr("action");
	var method = form.attr("method");
	$.ajax(url, {
		data: data,
		method: method,
		dataType: "script"
	})
}

		// var form = $(this)
		// var data = form.serialize();
		// var url = form.attr("action");
		// var method = form.attr("method");














