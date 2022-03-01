
$(document).ready( function () {
    $("#ajax-table").DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
            url:'/sport_dataset',
          dataSrc: 'sports',
          serverSide: true,
        },
          columns: [
            {name: 'Sport name', data: 'name'},
            {no_of_players: 'Players', data: 'no_of_players'},
          ],
          order: [['1', 'desc']]
    })
});