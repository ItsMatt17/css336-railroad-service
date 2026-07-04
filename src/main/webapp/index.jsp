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
			--primary: oklch(45% 0.017 213.2);
			--secondary: oklch(21.8% 0.008 223.9);
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
			border-radius: 1rem;
		
		}
		
		.field {
			display: flex;
			flex-direction: column;
			
		 }
		
		
		
	
	 </style>

</head>
<body>
	
	
	<form method="post" action="login.jsp" class="form">
		<div class="field"> 
			<label class="field__label" for="username">
				Username
				<input class="field__input" pattern=".{1,16}"type="text" id="username" name="username" required>
			</label>
		</div>
		
		<div class="field"> 
			<label class="field__label" for="password">
				Password
				<input class="field__input" pattern=".{1,25}" type="password" id="password" name="password" required>
			</label>
		</div>
		<input type="submit" value="Submit">
	</form>
	
	
</body>
</html>