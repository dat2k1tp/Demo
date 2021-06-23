function onClickHandle(event) {
		var check=confirm('Bạn có muốn xóa không?');
	 	if(check===false){
	 		event.preventDefault()
			
	 	}else if(check===true){
			alert("Đã được chuyển vào thùng rác !")
		}
	
		
		
	}
	
	function onClickHandleTwo(event) {
		var check=confirm('Bạn có muốn xóa vĩnh viễn không?');
	 	if(check===false){
	 		event.preventDefault()
	 	}
	}
	
	