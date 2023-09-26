function check(){
	let select = document.querySelector("select");
			
	var y = select.options[select.selectedIndex].text;
	
	if(y === "---Select---"){
		event.preventDefault();
		
		swal("Required","Please select answer option !!", "warning");
		return;
		}	
};