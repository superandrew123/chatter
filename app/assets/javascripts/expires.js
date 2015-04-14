function expireButton() {
	$(".expireSelect").on("click", changeExpire)
}

function changeExpire(e){
	e.preventDefault();
	e.stopPropagation();
	var url = $(this).attr("href");
	$.ajax(url, {
		method: "GET",
		dataType: "script"
	})
}