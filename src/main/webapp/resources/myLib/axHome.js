$(function() {
	$('#home').click(function() {
	   $.ajax({
		   type:"get",
		   url:"home",
		   success:function() {
			   location.reload();
		   },
		   error:function() {
			   alert("잠시만 기다려주세요");
		   }
	   }); //ajax
   }); //home
      
}); // ready