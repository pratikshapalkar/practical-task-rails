
$(document).ready( function () {
    $("#playerTable").DataTable({
        serverSide: true,
        ajax: 'get'
    })
} );

