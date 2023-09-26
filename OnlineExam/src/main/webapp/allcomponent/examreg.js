$(document).ready(function(){
	console.log("page is ready");
	var st,dt;
	$("#exam").on('submit', function(event){
		event.preventDefault();
		var f = $(this).serialize();
		console.log(f);
		
		$.ajax({
			url: "../ExamReg",
			data: f,
			type: 'POST',
			
			success: function(data, textStatus, jqXHR){
				console.log("success");
				st = "success"; 
				dt = data;
				console.log(data);
				
				Swal.fire({
				  title: 'Exam Added Successfully!!',
				  icon: 'success',
				  html:
				    'Exam ID is: '+data,
				  
				  showCloseButton: true,
				  focusConfirm: true,
				  confirmButtonText:
				    '<a href= "AddQuest.jsp" class="text-light link-offset-2 link-underline link-underline-opacity-0">OK</a>',
				  
				})
			},
			error: function(data, textStatus, errorThrown){
				console.log("error");
				console.log(data);	
			swal("Failed to Add!", "There is some error occured " + data, "error");
			}
		})
		
	})
});