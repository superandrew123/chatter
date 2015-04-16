// on document ready
// iterate over all the post divs
// if it has expired
// 
$(document).ready(function(){
  setInterval(function(){
    $(".countdown").each(function(){
      eventDate = Date.parse($(this).children('.expiredate').attr('value'))
      currentDate = Date.now()
      if (eventDate <= currentDate) {
        var rootUrl = "/posts/";
        var postID = $(this).parent().attr('post_id');
        var url =  rootUrl.concat(postID);
        $.ajax({
          method: 'DELETE',
          url: url,     
          dataType: "script"
        });
      }
    });
  }, 500);
});
