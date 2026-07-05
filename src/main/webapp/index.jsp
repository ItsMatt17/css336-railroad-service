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
			--border-rad: .5rem;
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
			padding: 1rem;		
			background-color: var(--secondary);
			border-radius: var(--border-rad);
			display: grid;
			gap: .825rem;
		
		}
		
		.field{ 
			display: flex;
			flex-direction: column;
			align-items: center;
		
		}
		
		.form__submit-container { 
			display: flex; 
			justify-content: center;
			
		
		}
		
	
		 
	 	.error{
	 		text-align: center;
		 	padding: 1rem;
		 	color: oklch(39.6% 0.141 25.723);
		 	background-color: oklch(80.8% 0.114 19.571);
		 	border-radius: var(--border-rad);
		 
		 }
	
	 </style>

</head>
<body>
		<% 
		// If user is alread logged in, just redirect to dashboard
		if (session.getAttribute("user") != null) response.sendRedirect("dashboard.jsp"); 
		%>
	
		<form method="post" action="login.jsp" class="form">
			<%if (request.getParameter("error") != null) { %>
			<div class="error">
				<p>Something went wrong with your login! Try again! <p/>
			</div>
			<% } %>
		
			<div class="field"> 		
				<label class="field__label" for="username">Username</label>
				<div class="field__input-container">
					<input class="field__input" 
						   type="text" 
						   name="username" 
						   id="username" 
						   pattern=".{1,16}"
						   required>
						   
				</div>
			</div>
			
			<div class="field"> 
				<label class="field__label" for="password">Password</label>
				<div class="field__input-container">			
					<input class="field__input" 
						   type="password" 
						   name="password" 
						   id="password" 
						   pattern=".{1, 25}"
						   required>	
				</div>
			</div>
			
			<div class="form__submit-container">
				<input class="form__submit" type="submit" value="Submit">
			</div>
		</form>
	
</body>
</html>