$(document).ready(function() {
	$('#table-student-payments').DataTable({
	  pagingType: 'full_numbers',
	  columnDefs: [ {
      	targets: 4,
      	searchable: false,
      	orderable: false
    } ]
	});
});