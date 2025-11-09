let commentVisible = false;

function doLike(pid,uid,operation){
 console.log(pid + " , "+uid)
 const d = {
  pid:pid,
  uid:uid,
  operation:operation
  }
  console.log(d)
  $.ajax({
     url: "likeServlet",
     type: "POST",
     data: d,
     success: function(data,textStatus,jqXHR){
       console.log(data);
       let c= $('#like-counter-'+pid).html();
       c++;
       $('#like-counter-' + pid).html(c)
     },
     error :function(jqXHR,textStatus,errorThrown){
       console.log(data);
     }
  })
}
