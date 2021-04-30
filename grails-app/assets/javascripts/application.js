// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require bootstrap
//= require popper.min
//= require select2.min
//= require jquery.dataTables.min
//= require dataTables.buttons.min
//= require jszip.min
//= require pdfmake.min
//= require vfs_fonts
//= require buttons.html5.min
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

var dataTable, exportTable
$(document).ready( function () {
	$("#spinner").fadeOut("fast");

	dataTable = $(".data-table").DataTable({
        responsive: true,
        scrollX: true
    });

    exportTable = $(".export-table").DataTable({
        responsive: true,
        scrollX: true,
        dom: 'Blfrtip',
        buttons: [{
            extend: 'copyHtml5',
            exportOptions: {
                columns: ":not(.not-for-export)"
            }
        }, {
            extend: 'csvHtml5',
            exportOptions: {
                columns: ":not(.not-for-export)"
            }
        }, {
            extend: 'excelHtml5',
            exportOptions: {
                columns: ":not(.not-for-export)"
            }
        }, {
            extend: 'pdfHtml5',
            orientation: 'landscape',
            pageSize: 'A4',
            exportOptions: {
                columns: ":not(.not-for-export)"
            }
        }]
    });

    $(".select2").select2();
}).on("ajaxSend submit", function() {
    $("input[type='submit']").blur();
    $("#spinner").fadeIn('fast');
})
.on("ajaxStop", function() {
    $("#spinner").fadeOut('fast');
})
.on("ajaxError", function(event, jqxhr, settings, exception) {
    $("#spinner").hide();                
});