
$(document).ready(function(){
 $('.table tbody tr:even').addClass('zebra');/*finds an element with the id of #table, targets the tbody, and selects every even row and adds a class of .zebra*/
    $('.table tbody tr').hover(function(){/*on hover (#table tbody tr), run anonymous function*/
        $(this).addClass('zebraHover');/*add class of zebraHover*/
    },function(){/*run anonymous function*/
        $(this).removeClass('zebraHover');/*when no longer hovering, remove class zebraHover*/
    });
    TABLE.dept_tableFormwork('#dept_table');
});
var TABLE={};
TABLE.dept_tableFormwork = function(table){
    var $tables = $(table);  
    $tables.each(function (){
        var _table = $(this);
        _table.find('thead tr').append($('<th class="edit">Action</th>'));
        _table.find('tbody tr').append($('<td class="edit"><button class="editbutton"><i class="fa fa-edit"></i></button><button class="deletebutton"><i class="fa fa-trash"></i></button></td>'));
	    /*_table.find('tbody tr').append($('<td class="edit"><a id="ed" href="javascript:void(0);"><i  class="fa fa-edit"></i></a> &nbsp; <a href="javascript:void(0);"><i  class="fa fa-trash"></i></a></td>'));*/
    });  
    $tables.find('.edit .editbutton').on('click', function(e){
        TABLE.editable(this,2);        
        e.preventDefault();
    });
};
TABLE.editable = function(button,editableCellNo){
    var $button = $(button);
    var $row = $button.parents('tbody tr');
    var $cells = $row.children('td').not('.edit');
    var celldata=0;
    var tabledata = [];
    var olddata = [];
    if($row.data('flag')) { // in edit mode, move back to table
        // cell methods        
        $cells.each(function(){
            celldata++;
            var _cell = $(this);            
            _cell.html(_cell.find('input').val());
            tabledata[celldata] = _cell.html();            
        });
        var data = "id="+tabledata[1]+ "&name="+tabledata[2].trim();
        $.ajax({
            url: "", //The url where the server req would we made.
            async: false,
            type: "POST", //The type which you want to use: GET/POST
            data: data,
            dataType: "html", //Return data type (what we expect).
            //This is the function which will be called if ajax call is successful.
            success: function(data){
                var msg ='true';
                if(data.trim()==='Err001'){
                    msg='false';
                    alert('Old Tax Rate and New Tax Rate is same.');                    
                }
                if(data.trim()==='Erroo2'){
                    msg='false';
                    alert('Old Tax Rate and New Tax Rate is same.');
                    
                }
            }
        });
        $row.data('flag', false);
        $button.html('<i class="fa fa-edit"></i>');
    }else{//in table mode, move to edit mode 
    //cell methods
     var cellno=0;
    $cells.each(function() {
        cellno++;        
        var _cell = $(this);
        _cell.data('text', _cell.html()).html('');
        var $input = $('<input type="text" class="form-control"/>').val(_cell.data('text').trim()).width(_cell.width()+20);
        var $divhidden = $('<div class="hide"></div>').html(_cell.data('text').trim()).width(_cell.width()+20);
        var $readonly = _cell.data('text').trim();
         
        if(cellno===editableCellNo){
            _cell.append($input);
        }else{
            _cell.append($readonly);
        }
    });
    $row.data('flag', true);
    $button.html('<i class="fa fa-save"></i>');
  }
};