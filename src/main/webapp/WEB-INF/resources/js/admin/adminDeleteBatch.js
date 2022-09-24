/**
 實現批次刪除的js 
 */
 var members = new Set([]);
$('.delete').on('click', function() {
	let checked = $(this).prop('checked')
	if (checked) {
		$(this).closest('tr').addClass('active')
		var deleteObject = $(this).parent().next().text()
		members.add(deleteObject);
	} else {
		var deleteObject = $(this).parent().next().text()
		members.delete(deleteObject);
		$(this).closest('tr').removeClass('active')
	}
});

$('#delete').submit(
	function() {
		$('#del').val(Array.from(members).join(' '))

	});