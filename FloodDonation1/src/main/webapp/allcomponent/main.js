const paymentStart = () => {
	console.log("payment started..");
	let amount = $("#amt").val();
	let name = $("#name").val();
	let email = $("#email").val();
	console.log(amount);
	console.log(email);
	
	if(amount == "" || amount == null){{
	//	alert("amount is required !!");
		swal("Error", "amount is required !!", "error");
		return;	
	}
	}
	
	$.ajax(
		{
			url:'/user/create_order',
			data:JSON.stringify({amount:amount, info:'order_request', name:name}),
			contentType:'application/json',
			type: 'POST',
			dataType:'json',
			success:function(response){
				//invoked where success
				console.log(response)
				if(response.status == "created"){
					//open payment form
					let options={
						key:'rzp_test_8YSQOMzpEtoQcs',
						amount:response.amount,
						currency:'INR',
						name: 'Flood Donation',
						description: 'Donation',
						image:'image/support.jpg',
						order_id:response.id,
						handler:function(response){
							console.log(response.razorpay_payment_id)
							console.log(response.razorpay_order_id)
							console.log(response.razorpay_signature),
							console.log('payment successful !!');
							updatePaymentOnServer(response.razorpay_payment_id, response.razorpay_order_id, "paid", email);
							
						//	alert('Congrats !! payment successful !!');
						//	swal("Good job!", "Congrats !! payment successful !!", "success");

						},
						prefill:{
							name: "",
							email: "",
							cntact: "",
						},
						notes:{
							address: "Flood help community",
						},
						theme:{
							color:"#3399cc",
						},
					};
					let rzp = new Razorpay(options);
					
					rzp.on("payment.failed", function(response){
						console.log(response.error.code);
						console.log(response.error.description);
						console.log(response.error.source);
						console.log(response.error.step);
						console.log(response.error.reason);
						console.log(response.error.metadata.order_id);
						console.log(response.error.metadata.payment_id);
					//	alert("Oops payment failed !!");
					//	swal("Failed", "Oops payment failed !!", "error");
					});
					rzp.open();
				}
			},
			error:function(error){
				//invoke when error
				console.log(error)
				alert("something went wrong !!")
			}
		}
	)
};

function updatePaymentOnServer(payment_id, order_id, status,email){
	$.ajax({
		url: "/update_order",
		data: JSON.stringify({
			payment_id: payment_id,
			order_id: order_id,
			status: status,
			email: email,
		}),
		contentType: "application/json",
		type: "POST",
		dataType: "json",
		success: function(response){
			swal("Good job!", "Congrats !! payment successful !!", "success");
		},
		error: function(error){
			swal("Failed", "Your payment is Successfull, but we did not get on server, we will contact you as soon as possible !!", "error");
		}, 
	});
}
