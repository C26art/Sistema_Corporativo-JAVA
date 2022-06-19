<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sair</title>
<link rel="icon" href="img/favicon.ico">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nuosu+SIL&display=swap');
*{
    margin: 0;
    padding: 0;
    font-family: 'Nuosu SIL', serif;
    box-sizing: border-box;
}
section{
    position: relative;
    width: 100%;
    height: 100vh;
    background: radial-gradient(#333,#000);
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}
section h2{    
    font-size: 5em;
    color: #fff;
    font-weight: 700;
    z-index: 100;
   
}
section .set{
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    pointer-events: none;
}
section .set div{
    position: absolute;
    display: block;
}
section .set div:nth-child(1){
    left: 20%;
    animation: animate 15s linear infinite;
    animation-delay: -7s;
    z-index: 0;
}
section .set div:nth-child(2){
    left: 50%;
    animation: animate 20s linear infinite;
    animation-delay: -5s;
    z-index:200;
}
section .set div:nth-child(3){
    left: 70%;
    animation: animate 15s linear infinite;
    animation-delay: -5s;
    z-index: 200;
}
section .set div:nth-child(4){
    left: 0%;
    animation: animate 15s linear infinite;
    animation-delay: -7s;
    z-index: 0;
}
section .set div:nth-child(5){
    left: 85%;
    animation: animate 18s linear infinite;
    animation-delay: -10s;
}
section .set div:nth-child(6){
    left: 0%;
    animation: animate 12s linear infinite;   
}
section .set div:nth-child(7){
    left: 15%;
    animation: animate 14s linear infinite;    
}
section .set div:nth-child(8){
    left: 60%;
    animation: animate 15s linear infinite;   
}
@keyframes animate{
    0%{
        opacity: 0;
        top: -10%;
        transform: translateX(20px) rotate(0deg);
    }
    10%{
        opacity: 1;        
    }
    20%{        
        transform: translateX(-20px) rotate(45deg);
    }
    40%{        
        transform: translateX(-20px) rotate(90deg);
    }
    60%{      
        transform: translateX(20px) rotate(180deg);
    }
    80%{        
        transform: translateX(-20px) rotate(180deg);
    }
    100%{      
        top: 110%;
        transform: translateX(-20px) rotate(225deg);
    }
}
.set2{
    transform: scale(2) rotateY(180deg);
    filter: blur(2);
}
.set3{
    transform: scale(0.8)rotateX(180deg);
    filter: blur(4);

</style>
</head>
<body>
<section>
        <h2>Obrigado!!!, até a Próxima...</h2>
        <div class="set">
           <div><img src="./img/leaves1.png" ></div>
           <div><img src="./img/leaves2.png" ></div>
           <div><img src="./img/leaves3.png" ></div>
           <div><img src="./img/leaves4.png" ></div>
           <div><img src="./img/leaves1.png" ></div>
           <div><img src="./img/leaves2.png" ></div>
           <div><img src="./img/leaves3.png" ></div>
           <div><img src="./img/leaves4.png" ></div>
        </div>
        <div class="set set2">
            <div><img src="./img/leaves1.png" ></div>
            <div><img src="./img/leaves2.png" ></div>
            <div><img src="./img/leaves3.png" ></div>
            <div><img src="./img/leaves4.png" ></div>
            <div><img src="./img/leaves1.png" ></div>
            <div><img src="./img/leaves2.png" ></div>
            <div><img src="./img/leaves3.png" ></div>
            <div><img src="./img/leaves4.png" ></div>
         </div>
         <div class="set set3">
            <div><img src="./img/leaves1.png" ></div>
            <div><img src="./img/leaves2.png" ></div>
            <div><img src="./img/leaves3.png" ></div>
            <div><img src="./img/leaves4.png" ></div>
            <div><img src="./img/leaves1.png" ></div>
            <div><img src="./img/leaves2.png" ></div>
            <div><img src="./img/leaves3.png" ></div>
            <div><img src="./img/leaves4.png" ></div>
         </div>
    </section>

</body>
</html>