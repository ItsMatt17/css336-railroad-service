<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>


	<style>
	
		*, 
		*::before, 
		*::after { 
			box-sizing: border-box;
			padding: 0;
			margin: 0;
		}
		
		:root {
			--primary: oklch(86.9% 0.022 252.894);
			--secondary: oklch(98.4% 0.003 247.858);	
		}
		
		
		body {
			min-height: 100vh;
			line-height: 1.3;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: var(--primary);
		}
		
		.form {
			width: 50%;
			max-width: 600px;
			
			display: flex;
			flex-direction: column;
			align-items: center;
			gap: 1rem;
			
			padding: 1rem;
			border-radius: .5rem;
			background-color: var(--secondary);	
		
		}	
		
		.field {
			width: 75%;
			display: flex; 
			flex-direction: column;
			
			
	
			
			.field__input {
        		width: 100%;
				padding: .5rem;
		
		 	}
		
		
		}
		
		 
	 	.error{
	 		text-align: center;
		 	padding: 1rem;
		 	color: oklch(39.6% 0.141 25.723);
		 	background-color: oklch(80.8% 0.114 19.571);
		 	border-radius: .5rem;
		 
		 }
		 
		
		
		
		
	
	 </style>

</head>
<body>
	
		<form method="post" action="login.jsp" class="form">
			<%if (request.getParameter("error") != null) { %>
			<div class="error">
				<p>Something went wrong with your login! Try again! <p/>
			</div>
			<% } %>
		
			<div class="field"> 		
				<label class="field__label" for="username">Username</label>
				<div class="field__input-container">
					<input class="field__input" type="text" name="username" id="username" required>
				</div>
			</div>
			
			<div class="field"> 
				<label class="field__label" for="password">Password</label>
				<div class="field__input-container">			
					<input class="field__input" type="password" name="password" id="password" required>
				</div>
			</div>
			
			<div class="form__input-container">
				<input class="form__submit" type="submit" value="Submit">
			</div>
		</form>
	
</body>
</html>