<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>

$(document).ready(function(){
$( "#target" ).click(function() {
	
	  alert( "Handler for .click() called." );
	 // $("#ajaxform").submit(); //SUBMIT FORM
	 $("#multiform").submit(); //Submit the form

	});
	
$("#ajaxform").submit(function(e)
		{
			var postData = $(this).serializeArray();
			var postDataS =  $(this).serialize();
			postData = JSON.stringify($(this).serializeArray());
			var formData = new FormData($(this)[0]);
			//var postDataS =  formData.serialize();
			alert(formData);
			//var postDataStr =  $(this).
			alert(postData);
			alert(postDataS);
			//alert(postDataStr);
		
		var formURL = $(this).attr("action");
	 		$.ajax(
			{
			//	url : formURL,
				type: "POST",
				//data : "postData="+postData,
				data : formData,
				//dataType: "json",
				contentType : "application/json",
				mimeType:"multipart/form-data",
				success:function(data, textStatus, jqXHR) 
				{
					alert(JSON.stringify(data));
				},
				error: function(jqXHR, textStatus, errorThrown) 
				{
				}
			});
		    e.preventDefault();	//STOP default action 
		});
		
});
		
	 	//Callback handler for form submit event
		$("#multiform").submit(function(e)
		{
		 
		    var formObj = $(this);
		    var formURL = formObj.attr("action");
		    var formData = new FormData(this);
			var postData = $(this).serializeArray();
			postData = JSON.stringify($(this).serializeArray());
			
		    $.ajax({
		        url: formURL,
		    type: 'POST',
		    //data : "postData="+postData &  formData,
		        data:  formData,
		    mimeType:"multipart/form-data",
		    contentType : "application/json",
		    //contentType: false,
		        cache: false,
		        processData:false,
		    success: function(data, textStatus, jqXHR)
		    {
		 
		    },
		     error: function(jqXHR, textStatus, errorThrown) 
		     {
		     }          
		    });
		    e.preventDefault(); //Prevent Default action. 
		    e.unbind();
		}); 
		 
		
		
		
/* var formData = JSON.stringify($("#myForm").serializeArray());
alert(formData);
$.ajax({
	  type: "POST",
	  url: "serverUrl",
	  data: formData,
	  success: function(){},
	  dataType: "json",
	  contentType : "application/json"
	})
	 */
</script>
<title>REST with Forms</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<form  action="" method="POST" enctype="multipart/form-data">
    Name: <input type="text" name="name"  value="Ravi"/> <br/>
    Age :<input type="text" name="age"  value="1" /> <br/>
    Image :<input type="file" name="photo" /><br/>
</form>

<form name="ajaxform" id="ajaxform" action="http://localhost:8080/billJpa/postData" method="POST" enctype="multipart/form-data">
First Name: <input type="text" name="fname" value ="mohan"/> <br/>
Last Name: <input type="text" name="lname" value ="krishnan" /> <br/>
Email : <input type="text" name="email" value="xxx@xx.com"/> <br/>
Select a file : <input type="file" name="file" size="50" />

<input type="button" id="target" value="Target" />
</form>


	<form method="post" action="http://localhost:8080/billJpa/messages">
		Name: <input type="text" name="name" id="name" /> 
		Message: <input type="text" name="message" id="message" /> 
		Item 1: <input type="text" name="thelist" id="thelist" /> 
		Item 2: <input type="text" name="thelist" id="thelist" /> 
				<input type="submit" value="Submit" />
	</form>

	<form action="myurl" method="POST" name="myForm">

		<p> <label for="first_name">First Name:</label> <input type="text" name="first_name" id="fname"> </p>
		<p> <label for="last_name">Last Name:</label> <input type="text" name="last_name" id="lname"> </p>
        	<input value="Submit" type="submit" onclick="submitform()">
	</form>


	<form name="multiform" id="multiform" action="http://localhost:8080/billJpa/file/uploads/" method="post" enctype="multipart/form-data">
		First Name: <input type="text" name="fname" value ="mohan"/> <br/>
		Last Name: <input type="text" name="lname" value ="krishnan" /> <br/>
		Email : <input type="text" name="email" value="xxx@xx.com"/> <br/>

		<p>
			Select a file : <input type="file" name="file" size="50" />
		</p>

		<input type="submit" value="Upload It" />
	</form>

	<form action="http://localhost:8080/billJpa/cust/addCustomer/" method="post">

		<table>
			<tr>
				<td><font face="verdana" size="2px">Customer Name : </font></td>
				<td><input type="text" name="nameKey" /></td>
			</tr>

			<tr>
				<td><font face="verdana" size="2px">Country</font></td>
				<td><input type="text" name="countryKey" /></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="Add Customer" /></td>
			</tr>
		</table>

	</form>

</body>
</html>