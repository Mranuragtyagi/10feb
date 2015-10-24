$('#database_div').hide();

function step1(){
	 $("#pre_label").removeClass('bg-btn');
    $("#pre_label").addClass('install_success');
    $("#db_label").addClass('bg-btn');
	$('#install_container').html($('#database_div').html());
	
	
	
	//alert($('#install_container').html());
	}
function step2(){
	$('#DBProp').validate();
		if ($("#durl").valid() && $("#port").valid() && $("#dbname").valid())  // check if form is valid
        {
	$("#db_label").removeClass('bg-btn');
    $("#db_label").addClass('install_success');
    $("#db_install").addClass('bg-btn');
	
	data="driver=com.mysql.jdbc.Driver&durl="+$("#durl").val()+"&port="+$("#port").val()+"&dbname="+$("#dbname").val()+"&username="+$("#username").val()+"&passw="+$("#passw").val()+"&maxactive="+$("#maxactive").val()+"&maxidle="+$("#maxidle").val();
	$('#install_container').html('<img src="assets/metro/img/d_process.gif" >');
			$.ajax({   
							url: "DBProp", //The url where the server req would we made.
							async: false,
							type: "POST", //The type which you want to use: GET/POST
							data:data,
							dataType: "html", //Return data type (what we expect).
							 
							//This is the function which will be called if ajax call is successful.
							success: function(data) {
							//alert(data);
								//data is the html of the page where the request is made.
								$('#install_container').html(data);
								//console.log(data);
							}
					});
					}
        else 
        {
           // alert("Correct Error");// just show validation errors, dont post
        }
	}

    var message = "Right Click Disabled!";
    function clickIE4() {
        if (event.button == 2) {
            alert(message);
            return false;
        }
    }
    function clickNS4(e) {
        if (document.layers || document.getElementById && !document.all) {
            if (e.which == 2 || e.which == 3) {
                alert(message);
                return false;
            }
        }
    }
    if (document.layers) {
        document.captureEvents(Event.MOUSEDOWN);
        document.onmousedown = clickNS4;
    } else if (document.all && !document.getElementById) {
        document.onmousedown = clickIE4;
    }
    document.oncontextmenu = new Function("alert(message);return false")



    
