<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <style>
  @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Open Sans", sans-serif;
  }
  
  body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    width: 100%;
    padding: 0 10px;
    background: url("mountain.jpg") center/cover no-repeat;
    position: relative;
  }
  
  body::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); 
  }
  
  .wrapper {
    width: 400px;
    border-radius: 8px;
    padding: 30px;
    text-align: center;
    border: 1px solid rgba(255, 255, 255, 0.5);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    z-index: 1;
  }
  
  form {
    display: flex;
    flex-direction: column;
  }
  
  h2 {
    font-size: 2rem;
    margin-bottom: 20px;
    color: #fff;
  }
  
  .input-field {
    position: relative;
    margin: 15px 0;
  }
  
  .input-field label {
    position: absolute;
    top: 50%;
    left: 0;
    transform: translateY(-50%);
    color: #fff;
    font-size: 16px;
    pointer-events: none;
    transition: 0.15s ease;
  }
  
  .input-field input {
    width: 100%;
    height: 40px;
    background: transparent;
    border: none;
    border-bottom: 2px solid #ccc;
    outline: none;
    font-size: 16px;
    color: #fff;
  }
  
  .input-field input:focus ~ label,
  .input-field input:valid ~ label {
    font-size: 0.8rem;
    top: 10px;
    transform: translateY(-120%);
  }

  /* Error message styling */
  label.error {
    display: block;
    color: #ff4d4d;
    font-size: 0.85rem;
    margin-top: 5px;
    text-align: left;
  }

  .forget {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 25px 0 35px 0;
    color: #fff;
  }
  
  .forget label {
    display: flex;
    align-items: center;
  }
  
  .forget label p {
    margin-left: 8px;
  }
  
  .wrapper a {
    color: #efefef;
    text-decoration: none;
  }
  
  .wrapper a:hover {
    text-decoration: underline;
  }
  
  button {
    background: #fff;
    color: #000;
    font-weight: 600;
    border: none;
    padding: 12px 20px;
    cursor: pointer;
    border-radius: 3px;
    font-size: 16px;
    border: 2px solid transparent;
    transition: 0.3s ease;
  }
  
  button:hover {
    color: #fff;
    border-color: #fff;
    background: rgba(255, 255, 255, 0.15);
  }
  
  .register {
    text-align: center;
    margin-top: 30px;
    color: #fff;
  }

  /* Footer Styling */
  footer {
    position: fixed; /* Fixed to the bottom right corner */
    bottom: 10px;
    right: 10px;
    color: #ccc;
    font-size: 0.9rem;
  }

  footer a {
    color: #fff;
    text-decoration: none;
    transition: color 0.3s ease;
  }

  footer a:hover {
    text-decoration: underline;
    color: #efefef;
  }
  </style>
</head>
<body>
  <div class="wrapper">
    <form action="#" id="login">
      <h2>Login</h2>
      <div class="input-field">
        <input type="text" name="email" id="email" required>
        <label for="email">Enter your email:</label>
      </div>
      <div class="input-field">
        <input type="password" name="password" id="password" required>
        <label for="password">Enter your password:</label>
      </div>
      <div class="forget">
        <label for="remember">
          <input type="checkbox" id="remember">
          <p>Remember me</p>
        </label>
        <a href="Forgot.jsp">Forgot password?</a>
      </div>
      <button type="submit">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="Signup.jsp">Register!</a></p>
      </div>
    </form>
  </div>

  <!-- Footer -->
  <footer>
    <p> For Employee Login | <a href="#" style="color: grey;"><i><b>Click here!</b></i></a></p>
  </footer>
</body>
</html>