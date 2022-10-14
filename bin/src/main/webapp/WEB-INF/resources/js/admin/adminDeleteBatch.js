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

$("#deleteSubmitCheck").on('click', function(event) {
	console.log(Array.from(members).join(' ').length);
	if (Array.from(members).join(' ').length != 0) {
		$('#del').val(Array.from(members).join(' '));
		Swal.fire({
			title: '確定要刪除下列資料?',
			text: 'id名稱為:' + $('#del').val() + '將被永久刪除，無法復原。',
			icon: 'warning',
			cancelButtonText: '取消',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '刪除'
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
					title: '刪除成功!',
					icon: 'success'
				}).then((result) => {
					$('#delete').submit();
				});
			}
		});
	} else {
		Swal.fire({
			title: '請選取想要永久刪除的資料。',
			icon: 'warning',
			cancelButtonColor: '#d33'
		})

	}
});