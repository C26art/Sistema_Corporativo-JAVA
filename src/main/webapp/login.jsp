<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title> 
 <link rel="stylesheet" href="./css/estilo.css">  
 
 <style>
/*Login*/
.container{
    border: 10px solid #fff;
}
section{
    position: relative;
    font-family: 'Tapestry', cursive;
    min-height: 100vh;
    background: rgb(233, 202, 146);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    transition: 0.5s;    
}
section.active{
    background: #3e3f39;
}
section .container{
    position: relative;
    width: 1400px;
    height: 710px;
    background: #fff;
    box-shadow: 0 15px 50px rgba(0, 0, 0,0.1);
    overflow:hidden;
}
section .container .user{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
}
section .container .user .imgBx{
    position: relative;
    width: 50%;
    height: 100%;
    background: #557085;
    transition: 0.5;
}
section .container .user .imgBx img{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
section .container .user .formBx{
    position: relative;
    width: 50%;
    height: 100%;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px;
    transition: 0.5s;    
}
section .container .user .formBx h1{
    font-size: 18px;   
    font-weight: 600;
    text-transform: uppercase;  
    letter-spacing: 2px;
    text-align: center;  
    width: 100%;
    position: absolute;
    top: 0;
    right: 0;
    margin-top: 20px;     
    color: #677eff;
}
.formBx h1::first-letter{
    margin: 10px 0px 10px 0px;
    font-size: 50px;
    font-weight: 600;
    color: #677eff;
    font-family: "Times New Roman", Times, serif;
}
section .container .user .formBx h2{
    font-size: 18px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 2px;
    text-align: center;
    width: 100%;
    margin-bottom: 10px;
    color: #555;
}
section .container .user .formBx input{
    position: relative;
    width: 100%;
    padding: 10px;
    background: #f5f5f5;
    color: #333;
    border: none;
    outline: none;
    box-shadow: none;
    margin: 8px 0;
    font-size: 14px;
    letter-spacing: 1px;
    font-weight: 300;
}
section .container .user .formBx input[type="submit"] {
    max-width: 100px;
    background: #677eff;
    color: #fff;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    transition: 0.5s;
}
section .container .user .formBx input[type="submit"] {
background:#e73e49 ;
border-radius: 5px;
}
section .container .user .formBx .signup{
    position: relative;
    margin-top: 20px;
    font-size: 12px;
    letter-spacing: 1px;
    color: #555;
    text-transform: uppercase;
    font-weight: 300;
}
section .container .user .formBx .signup a{
    font-weight: 600;
    text-decoration: none;
    color: #677eff;
}
section .container .user .formBx .signupBx{
    display: none;
}

section .container .signupBx{
    pointer-events: none;
}
section .container.active .signupBx{
    pointer-events: initial;
}
section .container .signupBx .formBx{
    top: 100%;
}
section .container.active .signupBx .formBx{
    top: 0;
}
section .container .signupBx .imgBx{
    top: -100%;
    transition:0.5s;
}
section .container.active .signupBx .imgBx{
    top: 0;
}

section .container .signinBx .formBx{
    top: 0;
}
section .container.active .signinBx .formBx{
    top: 100%;
}

section .container .signinBx .imgBx{
    top: 0;
    transition: 0.5s;
}
section .container.active .signinBx .imgBx{
    top: -100%;
}


 @media (max-width: 991px){
     section .container{
         max-width: 400px;
     }
     section .container .imgBx{
         display: none;
     }
     section .container .user .formBx{
         width: 100%;
     }
     section .container.active .signinBx .formBx{
         top: -100%;
     }
 }
 
 
 
 </style>
</head>
<body>
        <section>
            <div class="container">                
                <div class="user signinBx">                    
                    <div class="imgBx"><img src="./img/login4.jpg" ></div>
                    <div class="formBx">
                        <form action="LoginServlet" method="post">                                                   
                            <h1>Bem vindo!!!</h1>                           
                            <h2>Efetuar login</h2>
                            <input type ="text" name="nome" class="form-control" id="txtNome" placeholder="Nome:">
                            <input type ="password" name="login" class="form-control" id="txtLogin" placeholder="Login:">
                            <input type ="password" name="senha" class="form-control" id="txtSenha" placeholder="Senha:">
                            <input type="submit" name="singup" value="Entrar">
                <p class="signup">Não tem login? <a href="#" onclick="toggleForm(); ">Criar login.</a></p>
                        </form>
                    </div>
                </div>
                <div class="user signupBx">                   
                    <div class="formBx">
                        <form action="LoginServelet" method="post">
                            <img src="img/Logo.png" width="140" height="80" > 
                            <h2>Criar login</h2>
                            <input type ="text" name="nome" class="form-control" id="txtNome" placeholder="Nome:">
                            <input type ="password" name="login" class="form-control" id="txtLogin" placeholder="Criar login:">
                            <input type ="password" name="senha" class="form-control" id="txtSenha" placeholder="Criar senha:">
                            <input type="submit" name="singup" value="Criar login">
                <p class="signup">Possui login? <a href="#" onclick="toggleForm(); ">Digite seu login.</a></p>
                        </form>
                    </div>
                    <div class="imgBx"><img src="./img/login5.jpg" ></div>
                </div>                
            </div>
        </section> 
        <script>
            function toggleForm(){
                section = document.querySelector('section');
                container = document.querySelector('.container');
                container.classList.toggle('active');
                section.classList.toggle('active');
            }
        </script>
        <%
        	if (request.getAttribute("erro") != null){        
        	
        %>
        		<p><%= request.getAttribute("erro") %></p>
        <% } %>
</body>
</html>