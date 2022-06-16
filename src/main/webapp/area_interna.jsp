<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Login" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Funcionário Logado</title>
<link rel="icon" href="img/favicon.ico">
<style>

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;    
}

section{
    position: relative;
    width: 100%;
    min-height: 100vh;
    padding: 100px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    overflow-x: hidden;
}
header{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    padding: 40px 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 1000;
}
header .logo{
    position: relative;
    color: coral;
    display: inline-block;
    font-size: 4em;
    text-decoration: none;
    font-weight: 800;
    opacity: 0;
    animation: slide_left 0.5s linear forwards;
    animation-delay: 0.4s;
}
@keyframes slide_left{
    0%{
        transform: translateX(-100px);
        opacity: 0;
    }
    100%{
        transform: translateX(0px);
        opacity: 1;
    }

}
header ul{
    position: relative;
    display: flex;
}
header ul li {
    list-style: none;    
}
header ul li a {
    display: inline-block;
    color: #0169b2;
    font-weight: 700;
    font-size: 1.5em;
    margin-left: 10px;
    display: inline-block;
    padding: 8px 18px;
    text-decoration: none;
    user-select: none;
    opacity: 0;
    animation: slide_bottom 0.5s linear forwards;
    animation-delay: calc(0.2s * var(--i));
}
@keyframes slide_bottom{
    0%{
        transform: translateY(-100px);
        opacity: 0;
    }
    100%{
        transform: translateY(0px);
        opacity: 1;
    }
}
header ul li a.active,
header ul li a:hover{
    background-color: coral;
    color: #fff;
    border-radius: 30px;
}
.content{
    position: relative;
}
.content .textBox{
    position: relative;
    max-width: 550px;
}
.content .textBox h2{
color: #0169b2;
font-size: 3em;
margin-bottom: 10px;
line-height: 1.2em;
font-weight: 700;
opacity: 0;
    animation: slide_right 0.8s linear forwards;
    animation-delay: calc(0.2s * var(--i));
}
@keyframes slide_right{
    0%{
        transform: translateX(100px);
        opacity: 0;
    }
    100%{
        transform: translateX(0px);
        opacity: 1;
    }
}
.content  .textBox p{
    font-size: 1.1em;
    color: #333;
    text-align: justify;
}
.sci{
    position: absolute;
    bottom: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.sci li{
    list-style: none;
}
.sci li a{
    position: relative;
    display: inline-block;
    margin-right: 15px;
    width: 50px;
    height: 50px;
    background: #0169b2;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: 0.2s ease-in-out;
    opacity: 0;
    animation: slide_right 0.5s linear forwards;
    animation-delay: calc(0.1s * var(--i));
}
@keyframes slide_right{
    0%{
        transform: translateX(100px);
        opacity: 0;
    }
    100%{
        transform: translateX(0px);
        opacity: 1;
    }
}
.sci li a img{
    filter: invert(1);
    transform: scale(0.5);
}
.sci li a:hover{
background-color: coral;
transform: translateY(-10px);
}
.mosque{
    position: absolute;
    bottom: 0;
    right: 0;
    width: 700px;
    animation: fadein 3s linear forwards;  
}
@keyframes fadein{
    0%{       
        opacity: 0;
    }
    100%{       
        opacity: 1;
    }
}
@media (max-width: 991px){
    section{        
        padding: 150px 20px;       
    }
    header{
        padding: 20px;
    }
    .navigation{
        display: none;
    }
    .navigation.active{
        position:fixed;   
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #fff;    
        display: flex;
        justify-content: center; 
        align-items: center;
        flex-direction: column;
    }
    header ul li{
        margin: 10px 0;
    }
    header ul li a{
        margin-left: 0;
        font-size: 1.5em;
    }
    .toggle{
        position: fixed;
        top: 20px;
        right: 20px;
        width: 40px;
        height: 40px;
        background: #0169b2 url(../img/menu.png);        
        background-size: 30px;
        background-repeat: no-repeat;
        background-position: center;
        cursor: pointer;
        z-index: 1000;
        border-radius: 2px;
    }
    .toggle.active{        
        background: #0169b2 url(../img/close.png);        
        background-size: 25px;
        background-repeat: no-repeat;
        background-position: center;
        cursor: pointer;
        z-index: 1000;
        border-radius: 2px;
    }
    .mosque{
        max-width: 300px;
    }
    .content .textBox h2{
        font-size: 2.5em;        
    }
    .content .textBox p{
        font-size: 0.9em;
    }
    header .logo{       
        font-size: 2.5em;
        text-decoration: none;
        font-weight: 800;
    }
    .sci li a{        
        width: 30px;
        height: 30px;        
    }
}
@media (max-width: 600px){
.mosque{
    opacity: 0.4 !important;
}
}
</style>
</head>
<body>
		<%
		
			if (session.getAttribute("funcionarioLogado") == null){
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);			
			}
		
				Login log = (Login) session.getAttribute("funcionarioLogado");
		%>

			
    <section>
        <img src="./img/skate11.png" class="mosque">
        <header>
            <a class="logo"  href="area_interna.jsp"><img id="logo" src="img/Logo.png" width="180" height="110">SkateClub</a>
            <div class="toggle"></div>
            <ul class="navigation">
                <li><a href="index.jsp" style="--i:1;" class="active">Entrar</a></li>
                <li><a href="LogoffServlet" style="--i:2;">Sair</a></li>
            </ul>
        </header>
        <div class="content">
            <div class="textBox">
                <h2>Seja bem vindo, <%= log.getNome() %> </h2>
                <p>Com a necessidade de diminuir os custos para obter maiores lucros, as empresas tendem a tornar seus processos mais eficientes. O presente projeto foi desenvolvido para fornecer ferramentas capazes de auxiliar na diminuição dos custos. Nele estão contidas ferramentas de cadastro de entrada e saída (produto, empresa, usuários) e ferramentas de gerência que auxiliam na tomada de decisão e fornecem relatórios da situação atual. 
                    O projeto foi desenvolvido em etapas: análise, projeto, desenvolvimento e testes. Na etapa de análise foram gerados os casos de uso, digrama de classe, dicionário de dados e o plano de teste. Na etapa de projeto foi definida a utilização do Java como linguagem de programação, do Banco de Dados MySQL para persistência e da arquitetura do sistema. Nas etapas de desenvolvimento e teste, foi codificado o sistema e em seguida realizado os testes, utilizando o plano de teste, para assegurar sua qualidade.                     
                    Palavras-Chave: gerência, estoque, gerência de vendas e estoque, Java, documentação, UML.
                    </p>
            </div>           
        </div>
        <ul class="sci">
            <li><a href="#"  style="--i:10;"><img src="./img/facebook.png"></a></li>
            <li><a href="#"  style="--i:11;"><img src="./img/twitter.png"></a></li>
            <li><a href="#"  style="--i:12;"><img src="./img/instagram.png"></a></li>
        </ul>
        </section>

        <script>
            const menuToggle = document.querySelector('.toggle');
            const navigation = document.querySelector('.navigation');
            menuToggle.onclick = function(){
                menuToggle.classList.toggle('active');
                navigation.classList.toggle('active');
            }
        </script>
    
</body>
</html>