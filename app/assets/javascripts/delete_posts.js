// on document ready
// iterate over all the post divs
// if it has expired
// 
$(document).ready(function(){

    $(".countdown").each(function(){
        $(this).bind("DOMSubtreeModified", function() {


        eventDate = Date.parse($(this).children('.expiredate').attr('value'))
        currentDate = Date.now()
         // do something after the div content has changed
        if (eventDate <= currentDate) {
            var rootUrl = "/posts/";

            var postID = $(this).parent().attr('post_id');
            var url =  rootUrl.concat(postID);
            $.ajax({
                method: 'DELETE',
                url: url,     
                dataType: "script"
            });
            // deletePost($(this).parent());
        }

      }); 
    });
});



// function deletePost(post){
//   debugger;
//     var url1 = "/posts/";
//     var url2 = post.attr('post_id');
//     var url =  url1.concat(url2);
//      debugger;   
//     $.ajax(url, {
//         method: 'DELETE',     
//         dataType: "script"
//     })
// };



