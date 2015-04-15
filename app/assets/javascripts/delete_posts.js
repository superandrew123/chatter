function deletePost(post){
    var url1 = "/posts/";
    var url2 = post.attr('post_id');
    var url =  url1.concat(url2);
     debugger;   
    $.ajax(url, {
        method: 'DELETE',     
        dataType: "script"
    })
};