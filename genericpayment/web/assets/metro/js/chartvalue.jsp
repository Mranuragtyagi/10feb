<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+""; %>
$(function(){$('.hide-sidebar').click(function(){$('#sidebar').hide('fast',function(){$('#content').removeClass('span9');$('#content').addClass('span12');$('.hide-sidebar').hide();$('.show-sidebar').show();});});$('.show-sidebar').click(function(){$('#content').removeClass('span12');$('#content').addClass('span9');$('.show-sidebar').hide();$('.hide-sidebar').show();$('#sidebar').show('fast');});});(function(a){a.fn.scrollToTop=function(c){var d={speed:800};c&&a.extend(d,{speed:c});return this.each(function(){var b=a(this);a(window).scroll(function(){100<a(this).scrollTop()?b.fadeIn():b.fadeOut()});b.click(function(b){b.preventDefault();a("body, html").animate({scrollTop:0},d.speed)})})}})(jQuery);function labelFormatter(label,series){return"<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"+label+"<br/>"+Math.round(series.percent)+"%</div>";}
$(function(){$("#toTop").scrollToTop(1000);});var xmlhttp=false;if(window.XMLHttpRequest){xmlhttp=new XMLHttpRequest();}else if(window.ActiveXObject){try{xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");}catch(e){try{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}catch(e){xmlhttp=false;}}}
xmlhttp.open("POST","<%=ccp%>/GenericDataLoader",true);xmlhttp.send();xmlhttp.onreadystatechange=function(){
    if(xmlhttp.readyState==4){
        var jsonObj=JSON.parse(xmlhttp.responseText);
        if(jsonObj.weekly.length>0){
            var last_week={
                chart:{type:''},
                title:{text:''},
                xAxis:{categories:[]},
                yAxis:{title:{text:'Payment'}},
                legend:{backgroundColor:'#FFFFFF',reversed:true },
                series:[
                    {name:'Excise', color:'#660033',data:[]},
                    {name:'Mining', color:'#000066',data:[]},
                    {name:'Commercial-Tax',color:'#996600',data:[]},
                    {name:'Registration',color:'#6600FF',data:[]},
                    {name:'Transport',color:'#CC0000',data:[]},
                    {name:'Traffic Police',color:'#003300',data:[]}
                ]
            };
            for(var a=0;a<jsonObj.weekly.length;a++){
                last_week.series[0].data.push(jsonObj.weekly[a].expermit);
                last_week.series[1].data.push(jsonObj.weekly[a].mpermit);
                last_week.series[2].data.push(jsonObj.weekly[a].comtax);
                last_week.series[3].data.push(jsonObj.weekly[a].registration);
                last_week.series[4].data.push(jsonObj.weekly[a].transport);
                last_week.series[5].data.push(jsonObj.weekly[a].traffic); 
                last_week.xAxis.categories.push(jsonObj.weekly[a].pdate);
            }
            $(function(){$('#lastweek').highcharts(last_week);});
        }
        
        if(jsonObj.monthly.length>0){
            var monthly_data={
                chart:{type:'column'},title:{text:''},
                xAxis:{categories:[]},
                yAxis:{min:0,title:{text:'Payment'}},
                plotOptions:{
                    column:{pointPadding:0.2,borderWidth:0}
                },
                series:[
                    {name:'Excise', color:'#660033',data:[]},
                    {name:'Mining',color:'#000066',data:[]},
                    {name:'Commercial-Tax',color:'#996600',data:[]},
                    {name:'Registration',color:'#6600FF',data:[]},
                    {name:'Transport',color:'#CC0000',data:[]},
                    {name:'Traffic Police',color:'#003300',data:[]}
                ]
            };
            for(var x=0;x<jsonObj.monthly.length;x++){
                monthly_data.series[0].data.push(jsonObj.monthly[x].expermit);
                monthly_data.series[1].data.push(jsonObj.monthly[x].mpermit);
                monthly_data.series[2].data.push(jsonObj.monthly[x].comtax);
                monthly_data.series[3].data.push(jsonObj.monthly[x].registration);
                monthly_data.series[4].data.push(jsonObj.monthly[x].transport);
                monthly_data.series[5].data.push(jsonObj.monthly[x].traffic);
                monthly_data.xAxis.categories.push(jsonObj.monthly[x].month+'-'+jsonObj.monthly[x].year_int);
            }
            $(function(){$('#monthly_chart').highcharts(monthly_data);});
        }
        
        if(jsonObj.anualy.length>0){
            var annual_data={
                chart:{type:'bar'},title:{text:''},
                xAxis:{categories:[]},
                yAxis:{title:{text:'Payment'}},
                legend:{backgroundColor:'#FFFFFF',reversed:true,borderWidth:0},
                series:[
                    {name:'Excise', color:'#660033',data:[]},
                    {name:'Mining',color:'#000066',data:[]},
                    {name:'Commercial-Tax', color:'#996600',data:[]},
                    {name:'Registration',color:'#6600FF',data:[]},
                    {name:'Transport',color:'#CC0000',data:[]},
                    {name:'Traffic Police',color:'#003300',data:[]}
                ]
            };
            for(var x=0;x<jsonObj.anualy.length;x++){
                annual_data.series[0].data.push(jsonObj.anualy[x].expermit);
                annual_data.series[1].data.push(jsonObj.anualy[x].mpermit);
                annual_data.series[2].data.push(jsonObj.anualy[x].comtax);
                annual_data.series[3].data.push(jsonObj.anualy[x].registration);
                annual_data.series[4].data.push(jsonObj.anualy[x].transport);
                annual_data.series[5].data.push(jsonObj.anualy[x].traffic);
                annual_data.xAxis.categories.push(jsonObj.anualy[x].from_year+'-'+jsonObj.anualy[x].to_year);
            }
            $(function(){$('#annual_chart').highcharts(annual_data);});
        }
        
        if(jsonObj.caldata.length>0){var calendar={header:{left:'prev,next',center:'title',right:'today'},selectable:true,selectHelper:true,editable:true,events:[]};
            for(var x=0;x<jsonObj.caldata.length;x++){calendar.events.push({title:"Payment:"+jsonObj.caldata[x].combinetotal,start:new Date(jsonObj.caldata[x].issueddate)});}
            $('#calendar1').fullCalendar(calendar);
        }
        
        if(jsonObj.lastMonth2.length>0){
            for(var x=0; x<jsonObj.lastMonth2.length; x++){ 
           					for(var y=0; y<parseInt(jsonObj.lastMonth1.length); y++){ 
  if(jsonObj.lastMonth2[x].department==jsonObj.lastMonth1[y].department && jsonObj.lastMonth2[x].amount<jsonObj.lastMonth1[y].amount){
  $('#lastMonthData').append('<li><a href="#"><i class="fa fa-arrow-down red"> '+jsonObj.lastMonth2[x].amount+'</i> '+jsonObj.lastMonth2[x].department  +'</a></li>');
                            }
  else if(jsonObj.lastMonth2[x].department==jsonObj.lastMonth1[y].department && jsonObj.lastMonth2[x].amount>=jsonObj.lastMonth1[y].amount){
  $('#lastMonthData').append('<li><a href="#"><i class="fa fa-arrow-up green"> '+jsonObj.lastMonth2[x].amount+'</i> '+jsonObj.lastMonth2[x].department  +'</a></li> ');
 
                            
                            
                            }}
            
        }
    }
    }
};
