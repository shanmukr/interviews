function data_table_sortable( table_id, all_stories_count ){

  var dt_table = $('#'+table_id);
  var col = dt_table.children('thead').children('tr').children('th').size();
  var nu_columns = [];
  for (var i = 0; i <= col-1; i++) {
    nu_columns.push(i);
  }
 
  var footer = dt_table.append('<tfoot><tr></tr></tfoot>');
  var html_construct = '';
  $('#'+table_id+' thead th').each( function () {
    if ( !$(this).hasClass('no_sort') ){
      var title = $(this).text();
      html_construct += '<th><input type="text" placeholder="Search '+title+'" /></th>';
    } else {
      html_construct += '<th></th>';
    }
  });
  $('#'+table_id+' tfoot tr' ).append( html_construct );

  table = dt_table.DataTable( {
    searching: true,
    lengthChange: false,
    showNEntries: false,
    pageLength: 10,
    order: [],
    responsive: {
        details: false
    },
    dom: '<"col-md-6 col-sm-6"B><"col-md-6 col-sm-6"f><"col-md-12 col-sm-12"p>rti',
    buttons: [
              {
                  extend: 'copyHtml5',
                  exportOptions: {
                      columns: nu_columns
                  }
              },
              {
                  extend: 'csvHtml5',
                  exportOptions: {
                      columns: nu_columns
                  }
              },
              {
                  extend: 'excelHtml5',
                  exportOptions: {
                      columns: nu_columns
                  }
              },
              {
                  extend: 'pdfHtml5',
                  exportOptions: {
                      columns: nu_columns
                  }
              }
          ]
      
  });

  var new_table = dt_table.dataTable();
  table.columns().every( function () {
    var that = this;
    $( 'input', this.footer() ).on( 'keyup change', function () {
      that.search( this.value ).draw();
    });
  });

  $( 'input').on( 'keyup change', function () {
		$('#'+all_stories_count)[0].innerHTML = new_table.fnSettings().fnRecordsDisplay();
  });

}
