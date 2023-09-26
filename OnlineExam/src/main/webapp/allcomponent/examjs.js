
function next(){
	console.log("how are you");
	var f = null;
	
	$("#question").unbind("submit").on('submit', function(event){
		event.preventDefault();
		
		f = $(this).serialize();
		console.log(f);
		var tot = $(".total").val();
		
		$.ajax({
			url: "ExamEvent?by=next",
			data: f,
			type: 'POST',
			
			success: function(data){
				console.log("success");
				console.log(data +"next");
				
				var resp = JSON.parse(data);
				console.log(typeof resp.qid +" "+ typeof tot)
				$(".previous").prop("disabled", false);
				if(resp.qid > tot){
					console.log("next disabled")
					$(".next").prop("disabled", true);
				}
				
				$(".qid").text(resp.qid);
				if(resp.qid <= tot)
					$(".no").text("Quest. "+ resp.qid + ". ");
				else
					$(".no").text("Quest. "+ tot + ". ");
				$(".quest").text(resp.quest);
				$("#oa").text(resp.optiona);
				$("#ob").text(resp.optionb);
				$("#oc").text(resp.optionc);
				$("#od").text(resp.optiond);
				
				$("#optiona").prop("checked", false);
				$("#optionb").prop("checked", false);
				$("#optionc").prop("checked", false);
				$("#optiond").prop("checked", false);
				
			},
			error: function(response){
				console.log("error");
				console.log(response);	
			swal("Try again!", "There is some error occured " + response, "error");
			}
		})
		})
}

function finalsubmit(){
	console.log("how are you");
	var f = null;
	
	$("#question").unbind("submit").on('submit', function(event){
		event.preventDefault();
		
		f = $(this).serialize();
		console.log(f);
		var tot = $(".total").val();
		Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Submit!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    $.ajax({
			url: "ExamEvent?by=submit",
			data: f,
			type: 'POST',
			
			success: function(data){
				console.log("success");
				console.log(data +"next");
				window.location.href = data;
			},
			error: function(response){
				console.log("error");
				console.log(response);	
			swal("Try again!", "There is some error occured " + response, "error");
			}
		})
		    
		  }
		})
		
		
		})
}



function previous(){
	console.log("how are you");
	var f = null;
	
	$("#question").unbind("submit").on('submit', function(event){
		event.preventDefault();
		
		f = $(this).serialize();
		console.log(f);
		
		$.ajax({
			url: "ExamEvent?by=prev",
			data: f,
			type: 'POST',
			
			success: function(data){
				console.log("success");
				console.log(data+ "previous");
				
					
				var resp = JSON.parse(data);
				$(".next").prop("disabled", false);
				if(resp.qid < 1){
					$(".previous").prop("disabled", true);
				}
				
				$(".qid").text(resp.qid);
				if(resp.qid >0)
					$(".no").text("Quest. "+ resp.qid + ". ");
				else
					$(".no").text("Quest. "+ 1 + ". ");
				
				$(".quest").text(resp.quest);
				$("#oa").text(resp.optiona);
				$("#ob").text(resp.optionb);
				$("#oc").text(resp.optionc);
				$("#od").text(resp.optiond);
				
				$("#optiona").prop("checked", false);
				$("#optionb").prop("checked", false);
				$("#optionc").prop("checked", false);
				$("#optiond").prop("checked", false);
				
			},
			error: function(response){
				console.log("error");
				console.log(response);	
			swal("Try again!", "There is some error occured " + response, "error");
			}
		})
		})
}

$("document").ready(function(){
	var tot, duration = $(".duration").val();
	tot = duration;
	$(window).keydown(function(event){

    if(event.keyCode == 116) {

      event.preventDefault();

      return false;

    }

  });
	startTimer(tot,duration);

});
function startTimer(tot, duration){
	let t = window.setInterval(() => {
		if(tot<= 0){
			clearInterval(t);
		} else{
			tot--;
			var wi = (tot*100)/duration;
			console.log(wi);
			$(".ani").width(wi+"%");
			
			let hh,mm,ss;
			hh = Math.floor(tot/3600);
			mm = Math.floor((tot%3600)/60);
			ss = Math.floor(tot%60);
			
			$(".timer").text(hh+":"+mm+":"+ss);
			if(tot <1){
			   
				console.log("how are you");
				var f = null;
				
				
					
					console.log("auto");
				    
				
					f = $("#question").serialize();
					console.log(f);
					
					    $.ajax({
						url: "ExamEvent?by=submit",
						data: f,
						type: 'POST',
						
						success: function(data){
							console.log("success");
							Swal.fire({
							  title: 'Time Over',
							  text: "Your exam submitted Automatically!",
							  icon: 'warning',
							  
							  confirmButtonColor: '#3085d6',
							  
							  confirmButtonText: 'Ok'
							}).then((result) => {
							  if (result.isConfirmed) {
							   window.location.href = data;
							    
							  }
							  else{
								 window.location.href = data; 
							  }
							})
							
						},
						error: function(response){
							console.log("error");
							console.log(response);	
						swal("Try again!", "There is some error occured " + response, "error");
						}
					});
					
					
				}
			}
	}, 1000);
}







