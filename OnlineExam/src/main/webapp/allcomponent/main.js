function checkbox() {
			var x = document.getElementById("accept").checked;
			
			let select = document.querySelector("select");
			
			var y = select.options[select.selectedIndex].text;
			
			
			
			console.log(y);
			if(y === "---Select---"){
				swal("Required","Please select exam !!", "warning");
				}
			if(x == false){
				swal("Required","Please accept term and condition !!", "warning");
				}
		};
		
	const myToast = new bootstrap.Toast('.toast');
	 myToast.show();
	 setTimeout(()=> {
		 myToast.hide();
	 }, 5000);
	 
function check(){
	let select = document.querySelector("select");
			
	var y = select.options[select.selectedIndex].text;
	
	if(y === "---Select---"){
		swal("Required","Please select user type !!", "warning");
		return;
		}	
	var x = document.getElementById("accept").checked;	
	if(x == false){
		swal("Required","Please accept term and condition !!", "warning");
		return;
	}
};