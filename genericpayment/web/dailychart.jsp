<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
 

<title>Pass date parameter to line chart</title>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>jQuery UI Datepicker - Icon trigger</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
  
  </script>
  
  <script type="text/javascript">
  var options;
  
  $(document).ready(function() {
        
	    options = {
	      chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: [],
                labels: {
					align: 'center',
					x: -3,
					y: 20,
					formatter: function() {
						return Highcharts.dateFormat('%l%p', Date.parse(this.value +' UTC'));
					}
				}
            },
            yAxis: {
                title: {
                    text: ''
                }
            },
            tooltip: {
                enabled: false,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y;
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },

            series: [{
	                type: 'line',
	                name: '',
	                data: []
	       }]
		}

        $.getJSON("data.php", function(json){
        	options.xAxis.categories = json['category'];
        	options.series[0].name = json['name'];
        	options.series[0].data = json['data'];
        	chart = new Highcharts.Chart(options);
		});

    });
    
    $(function() {
	    $( "#datepicker" ).datepicker({
		  dateFormat: "yy-mm-dd",
	      showOn: "button",
	      buttonImage: "calendar.gif",
	      buttonImageOnly: true,
	      onSelect: function(dateText, inst) { 
	        $.getJSON("data.php?dateParam="+dateText, function(json){
	        	options.xAxis.categories = json['category'];
        		options.series[0].name = json['name'];
        		options.series[0].data = json['data'];
	        	chart = new Highcharts.Chart(options);
			});
	      }
	    });
  	});
    
	</script>
  
</head>
<body>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<h2>Select between February 1, 2013 and March 31, 2013</h2>

<p>Date: <input type="text" id="datepicker" /></p>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

</body>
</html>