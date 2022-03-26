$(document).ready( function () {
  $("#ajax-table").DataTable({
    processing: true,
    paging: true,
    serverSide: true,
    responsive: false,
    ajax: {
      "url": "/sports/sport_dataset",
      "dataSrc": "sports",
      dataFilter: function (data) {
        var json = jQuery.parseJSON(data);
        return JSON.stringify(json);
      },
    },
      columns: [
        
        {
          title: 'Sport Name',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.name
          }
        },
        {
          title: 'No Of Players',
          data: null,
          searchable: true,
          render: function (data, type, row) {
            return data.no_of_players
          },
          
        },
        {
            title: 'Actions', data: null,
            searchable: true,
            render: function (data, type, row) {
            var action_html = ''
            action_html =action_html + "<a class='dropdown-item' href = '/sports/new'" +
              "data-toggle='tooltip' data-placement='top' data-original-title='Add Sport'>" + 
              "<i class='feather icon-edit-2'></i> Add Sport</a>"+
              "<a class='dropdown-item' href = '/sports/" + data.id + "/edit'" +
              "data-toggle='tooltip' data-placement='top' data-original-title='Edit Sport'>" +
              "<i class='feather icon-edit-2'></i> Edit</a>"+ 
              "<a class='btn btn-info btn-sm' href = '/sports/" + data.id +
              "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Destroy Business'>"
              + 'Delete' + '</a>'
            action_html = action_html + '</div></div></div>'
            return action_html;
            }
          }
      ],
      dom: '<"top"<"actions action-btns"B><"action-filters"lf>><"clear">rt<"bottom"<"actions">p>',
    oLanguage: {
      sLengthMenu: "_MENU_",
      sSearch: ""
    },
    aLengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
    order: [[1, "asc"]],
    bInfo: false,
    pageLength: 10,
    // oLanguage: {
    //   sProcessing: "<div class='spinner-border' role='status'><span class='sr-only'></span></div>"
    // },
    aoColumnDefs: [
      {'bSortable': false, 'aTargets': [0]}
    ],

    initComplete: function (settings, json) {
      $(".dt-buttons .btn").removeClass("btn-secondary");
      // $('.dataTables_filter').addClass('search-icon-placement');
    },
      
    order: [['1', 'desc']]
  });

});