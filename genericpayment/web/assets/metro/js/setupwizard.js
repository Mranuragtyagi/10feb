function load_dept_list(){
	$.ajax({
            url: $("#ccp").val()+"/wizard/dept_list.jsp", //The url where the server req would we made.
            async: false,
            type: "POST", //The type which you want to use: GET/POST
           // data: data,
            dataType: "html", //Return data type (what we expect).
            //This is the function which will be called if ajax call is successful.
            success: function(data){
				$('#dept_list').html(data);
				 $('.table').hide();
    			 $('.table').fadeIn(1000)
				}
	});
	
	}
$(document).ready(function(){
	load_dept_list();
   
});