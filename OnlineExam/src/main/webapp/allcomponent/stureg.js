$(document).ready(function(){
	console.log("page is ready");
	
	$("#register").on('submit', function(event){
		event.preventDefault();
		var f = $(this).serialize();
		console.log(f);
		
		$.ajax({
			url: "RegisterServlet",
			data: f,
			type: 'POST',
			
			success: function(data, textStatus, jqXHR){
				console.log("success");
				console.log(data);
				Swal.fire({
				  title: 'Registerd Successfully!!',
				  icon: 'success',
				  html:
				    'Login ID is: '+data,
				  
				  showCloseButton: true,
				  focusConfirm: true,
				  confirmButtonText:
				    '<a href= "index.jsp" class="text-light link-offset-2 link-underline link-underline-opacity-0">OK</a>',
				  
				})
			},
			error: function(data, textStatus, errorThrown){
				console.log("error");
				console.log(data);	
				swal("Registration Failed!", "There is some error occured " + data, "error");
			}
		})
	})
});