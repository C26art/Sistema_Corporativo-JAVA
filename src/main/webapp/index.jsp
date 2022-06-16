<!DOCTYPE html>
<%@ page import="model.Conexao" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.util.Date" %>
<%@ page import="model.Produtos" %>
<%@ page import="model.Fornecedor" %>
<%@ page import="model.ControleSaida" %>
<%@ page import="DAO.ControleSaidaDao" %>
<%@ page import="br.com.controller.ControleSaidaController" %>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle de Estoque</title>
   <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" href="./css/style.css">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Amiri:ital,wght@0,400;0,700;1,400&family=Ubuntu:wght@300;400;500;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Ubuntu', sans-serif;
}
:root {
    --blue:#1e1e27;
    --white:#fff;
    --grey:#f28123;
    --black:#000;
    --black2:#f28123;
}
body{
    min-height: 100vh;
    overflow-x: hidden;    
}
.container{
    position: relative;
    width: 100%;
}
.navigation{
    position: fixed;
    width: 300px;
    height: 100%;
    background: var(--blue);
    border-left: 10px solid var(--blue);
    transition: 0.5s;
    overflow: hidden;
}
.navigation.active{
    width: 70px;
}
.navigation ul {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
}
.navigation ul li{
    position: relative;
    width: 100%;
    list-style: none;
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px; 
}
.navigation ul li:hover,
.navigation ul li.hovered{
    background: var(--white);
}
.navigation ul li:nth-child(1) {
    margin-bottom: 40px;
    pointer-events: none;
}
.navigation ul li a{
    position: relative;
    display: block;
    width: 100%;
    display: flex;
    text-decoration: none;
    color: var(--white);
}
.navigation ul li:hover a,
.navigation ul li.hovered a{
color: var(--blue);
}
.navigation ul li a .icon{
    position: relative;
    display: block;
    min-width: 60px;
    height: 60px;
    line-height: 70px;
    text-align: center;
}
.navigation ul li a .icon ion-icon{
    font-size: 1.75em;
}
.navigation ul li a .title{
    position: relative;
    display: block;
    padding: 0 10px;
    height: 60px;
    line-height: 60px;
    text-align: start;
    white-space: nowrap;
}
.navigation ul li:hover a::before,
.navigation ul li.hovered a::before{
    content: "";
    position: absolute;
    right: 0;
    top: -50px;
    width: 50px;
    height: 50px;
    background:transparent;
    border-radius: 50%;
    box-shadow: 35px 35px 0 10px var(--white);
    pointer-events: none;
}
.navigation ul li:hover a::after,
.navigation ul li.hovered a::after{
    content: "";
    position: absolute;
    right: 0;
    bottom: -50px;
    width: 50px;
    height: 50px;
    background:transparent;
    border-radius: 50%;
    box-shadow: 35px -35px 0 10px var(--white);
    pointer-events: none;
}
.main{
    position: absolute;
    width: calc(100% - 300px);
    left: 300px;
    min-height: 100vh;
    background: var(--white);
    transition: 0.5s;
}
.main.active{
    width: calc(100% - 80px);
    left: 80px;
}
.topbar{
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
}
.toggle{
    position: relative;
    width: 60px;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 2.5em;
    cursor: pointer;
}
.search{
    position: relative;
    width: 400px;
    margin: 0 10px;
}

.search label{
    position: relative;
    width: 100%;
}
.search  label input{
    width: 100%;
    height: 40px;
    border-radius: 40px;
    padding: 5px 20px;
    padding-left: 35px;
    font-size: 18px;
    outline: none;
    border: 1px solid var(--black2);
}
.search label ion-icon{
    position: absolute;
    top: 0;
    left: 10px;
    font-size: 1.2em;
}
.user{
    position: relative;
    min-width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
    cursor: pointer;    
}
.user img{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.cardBox{
    position: relative;   
    width: 100%;
    padding: 20px;
    display: grid;
    grid-template-columns: repeat(4,1fr);
    grid-gap:30px;
}
.cardBox .card{
    position: relative;   
    background: var(--white);
    padding: 30px;
    display: flex;
    justify-content: space-between;
    cursor: pointer;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
}
.cardBox .card .numbers{
    position: relative;
    font-weight: 500;
    font-size: 2.5em;
    color: var(--blue);
}
.cardBox .card .cardName{
color: var(--black2);
font-size: 1.1em;
margin-top: 5px;
}
.cardBox .card .iconBx{
    font-size: 3.5em;
    color: var(--black2);
}
.cardBox .card:hover{
    background: var(--blue);    
}
.cardBox .card:hover .numbers,
.cardBox .card:hover .cardName,
.cardBox .card:hover .iconBx{
    color: var(--white);
}
.graphBox{
    position: relative;
    width: 100%;
    padding: 20px;
    display: grid;
    grid-template-columns: 1fr 2fr;
    grid-gap:30px;
    min-height: 200px;
}
.graphBox .box{
    position: relative;
    background: var(--white);
    padding: 20px;
    width: 100%;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
    border-radius: 20px;
}
.details{
    position: relative;
    width: 100%;
    padding: 20px;
    display: grid;
    grid-template-columns: 2fr 1fr;
    grid-gap:30px;
    margin-top: 10px;
}
.details .recentOrders{
    position: relative;
    display: grid;
    min-height: 500px;
    background: var(--white);
    padding: 20px;
 	box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
    border-radius: 20px;
}
.cardHeader{
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}
.cardHeader h2{
    font-weight: 600;
    color: var(--blue);
}
.btn{
    position: relative;
    padding: 5px 10px;
    background: var(--blue);
    text-decoration: none;
    color: var(--white);
    border-radius: 6px;
}
.details table{
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}
.details table thead td{
    font-weight: 600;
}
.details .recentOrders table tr{
    color: var(--black);
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.details .recentOrders table tr:last-child{
    border-bottom: none;
}
.details .recentOrders table tbody tr:hover{
    background: var(--blue);
    color: var(--white);
}
.details .recentOrders table tr td{
    padding: 10px;
}
.details .recentOrders table tr td:last-child{
    text-align: end;
}
.details .recentOrders table tr td:nth-child(2){
    text-align: end;
}
.details .recentOrders table tr td:nth-child(3){
    text-align: center;
}
.status.delivered{
    padding: 2px 4px;
    background: green;
    color: var(--white);
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;    
}
.status.pending{
    padding: 2px 4px;
    background: #f9ca3f;
    color: var(--white);
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;    
}
.status.return{
    padding: 2px 4px;
    background: #f00;
    color: var(--white);
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;    
}
.status.inprogress{
    padding: 2px 4px;
    background: #1795ce;
    color: var(--white);
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;    
}
.recentCustomers{
    position: relative;
    display: grid;
    min-height: 500px;
    padding: 20px;
    background: var(--white);
    box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
    border-radius: 20px;
}
.recentCustomers .imgBx{
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
}
.recentCustomers .imgBx img{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.recentCustomers table tr td{
    padding: 18px 10px;
    letter-spacing: 1px;
}
.recentCustomers table tr td h4 span{
font-size: 14px;
color: var(--black2);
}
.recentCustomers table tr:hover{
    background: var(--blue);
    color: var(--white);
}
.recentCustomers table tr:hover td h4 span{
    color: var(--white);
}

@media(max-width:991px){
    .graphBox{
        grid-template-columns: 1fr;
        height: auto;
    }
    .navigation{
        left: -300px;
    }
    .navigation.active{
        width: 300px;
        left: 0;
    }
    .main{
        width: 100%;
        left: 0;
    }
    .main.active{
        left: 300px;
    }
    .cardBox{
        grid-template-columns: repeat(2,1fr);
    }
}
@media(max-width:768px){
    .details{
    grid-template-columns: repeat(1,1fr);
}
    .recentOrders{
    overflow-x: auto;
}
    .status.inprogress{
    white-space: nowrap;
}
}
@media(max-width:480px){
    .cardBox{
        grid-template-columns: repeat(1,1fr);
 }
    .cardHeader h2{
        font-size: 20px;
}
    .user{
        min-width: 40px;
}
    .navigation{
        width: 100%;
        left: -100%;
        z-index: 1000;
}
    .navigation.active{
        width: 100%;
        left: 0;
}
    .toggle{
        z-index: 10001;
}
    .main.active .toggle{
        position: fixed;
        right: 0;
        left: initial;
        color:var(--white);
}

}    
    </style>
    
</head>
<body>

<div>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <img src="img/Logo.png" width="70" height="66", style="margin-top: 7px; " > 
                        <span class="title" style="font-size: 1.5em; font-weight: 500;"> SkateClub </span>                        
                    </a>
                </li>
                <li class="hovered">
                    <a href="#">
                        <img src="img/home.png" width="39" height="39", style="margin-top: 8px; margin-left:3px " >
                        <span class="title" style="margin-left:3px"> Dashbord </span>
                    </a>
                </li>
                <li>
                    <a href="cadastroproduto.jsp">
                        <img src="img/logoEstoque.png" width="39" height="39", style="margin-top: 8px; margin-left:3px " >
                        <span class="title" style="margin-left:9px"> Cadastro Produtos </span>
                    </a>
                </li>
                <li>
                    <a href="indexFunc.jsp">
                        <img src="img/logoFuncionarios.png" width="47" height="47", style="margin-top: 7px;" >
                        <span class="title" style="margin-left:4px"> Cadastro de Funcionarios </span>
                    </a>
                </li>
                <li>
                    <a href="indexfornecedor.jsp">
                        <img src="img/logoFornecedor.png" width="46" height="46", style="margin-top: 8px; margin-left:3px " >
                        <span class="title" style="margin-left:1px"> Cadastro de Fornecedores </span>
                    </a>
                </li>
                <li>
                    <a href="cadastrocontroleentrada.jsp">
                        <img src="img/relatorio.png" width="42" height="42", style="margin-top: 8px; margin-left:7px " >
                        <span class="title"> Relatório de Entrada </span>
                    </a>
                </li>
                <li>
                    <a href="cadastrocontrolesaida.jsp">
                        <img src="img/relatorio.png" width="42" height="42", style="margin-top: 8px; margin-left:7px " >
                        <span class="title"> Relatório de Saida </span>
                    </a>
                </li>
                 <li>
                    <a href="login.jsp">
                        <img src="img/administracao1.png" width="49" height="52", style="margin-top: 8px; margin-left:2px " >
                        <span class="title"> Administrativo </span>
                    </a>
                </li>
                <li>
                    <a href="login.jsp">
                        <img src="img/cadeado3.png" width="40" height="40", style="margin-top: 8px; margin-left:9px " >
                        <span class="title"> Sair </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>                
            </div>
            <div class="search">
                <label>
                    <input type="text" placeholder="Procurar" " id="mysearch">
                    <span class="clear" onclick="document.getElementById('mysearch').value = '' "></span>
                    <ion-icon name="search-outline"></ion-icon>
                </label>
            </div>
            <div class="user">
                <img src="img/Logo.png" width="72" height="68", style="margin-top: 7px; " >
            </div>
        </div>
        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="numbers">1.540</div>
                    <div class="cardName">Visualizações</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="numbers">80</div>
                    <div class="cardName">Vendas</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="cart-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="numbers">283</div>
                    <div class="cardName">Comentários</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="chatbubbles-outline"></ion-icon>
                </div>
            </div>
            <div class="card">
                <div>
                    <div class="numbers">R$ 7.800,00</div>
                    <div class="cardName">Lucro</div>
                </div>
                <div class="iconBx">
                    <ion-icon name="cash-outline"></ion-icon>
                </div>
            </div>
        </div>
        <div class="graphBox">            
            <div class="box"><canvas id="myChart"></canvas>
            </div>
            <div class="box"><canvas id="earning"></canvas>
            </div>
            <div class="box"><canvas id="learning"></canvas>
            </div>
        </div>



        <div class="details">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Últimos Pedidos</h2>
                    <a href="#" class="btn">Visualizar</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Skate Power Peralta</td>
                            <td>R$ 1.200,00</td>
                            <td>Pago</td>
                            <td><span class="status inprogress">Em andamento</span></td>
                        </tr>                    
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                   
                        <tr>
                            <td>Shape Element</td>
                            <td>R$ 800,00</td>
                            <td>Vencimento</td>
                            <td><span class="status pending">Pendente</span></td>
                        </tr>                   
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                   
                        <tr>
                            <td>Rodas</td>
                            <td>R$ 230,00</td>
                            <td>Pago</td>
                            <td><span class="status delivered">Entregue</span></td>
                        </tr>                    
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                  
                        <tr>
                            <td>Skate Urgh</td>
                            <td>R$ 450,00</td>
                            <td>Pago</td>
                            <td><span class="status inprogress">Em andamento</span></td>
                        </tr>                  
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                   
                        <tr>
                            <td>Shape Cisco</td>
                            <td>R$ 600,00</td>
                            <td>Pago</td>
                            <td><span class="status delivered">Entregue</span></td>
                        </tr>                   
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                   
                        <tr>
                            <td>Rodas Simms</td>
                            <td>R$ 300,00</td>
                            <td>Pago</td>
                            <td><span class="status return">Retornou</span></td>
                        </tr>                   
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                    
                        <tr>
                            <td>Truck Independent</td>
                            <td>R$ 920,00</td>
                            <td>Pago</td>
                            <td><span class="status delivered">Entregue</span></td>
                        </tr>                  
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                    
                        <tr>
                            <td>Shape Power Peralta</td>
                            <td>R$ 500,00</td>
                            <td>Pago</td>
                            <td><span class="status return">Retornou</span></td>
                        </tr>                   
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                             
                        <tr>
                            <td>Nome</td>
                            <td>Preço</td>
                            <td>Pagamento</td>
                            <td>Status</td>
                        </tr>                  
                        <tr>
                            <td>Rolamento NHBB</td>
                            <td>R$ 200,00</td>
                            <td>Pago</td>
                            <td><span class="status return">Retornou</span></td>
                        </tr>                           
                    </tbody>
                </table>
            </div>
            <div class="recentCustomers">
                <div class="cardHeader">
                    <h2>Novos Clientes</h2>                    
                </div>
                <table>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img1.jpg"></div></td>
                        <td><h4>Arthur<br><span>Rio de Janeiro</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img2.jpg"></div></td>
                        <td><h4>André<br><span>Niterói</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img3.jpg"></div></td>
                        <td><h4>Luciana<br><span>São Gonçalo</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img4.jpg"></div></td>
                        <td><h4>Julia<br><span>Rio de Janeiro</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img5.jpg"></div></td>
                        <td><h4>Marcos<br><span>Niterói</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img6.jpg"></div></td>
                        <td><h4>Fábio<br><span>Duque de Caxias</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img7.jpg"></div></td>
                        <td><h4>Paloma<br><span>Búzios</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img8.jpg"></div></td>
                        <td><h4>Caio<br><span>Rio de Janeiro</span></h4></td>
                    </tr>
                    <tr>
                        <td width="60px"><div class="imgBx"><img src="./img/img9.jpg"></div></td>
                        <td><h4>Valentinna<br><span>Petrópolis</span></h4></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

    


     <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="my_chart.js/my_chart.js"></script>

    <script>
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');

        toggle.onclick = function(){
            navigation.classList.toggle('active');
        }

        let list = document.querySelectorAll('.navigation li ');
        function activeLink(){
            list.forEach((item) =>
            item.classList.remove('hovered'));
            this.classList.add('hovered');
        }
        list.forEach((item) =>
        item.addEventListener('mouseover', activeLink ));
    </script>
    
    <script>
    
    const ctx = document.getElementById('myChart').getContext('2d');
    const earning = document.getElementById('earning').getContext('2d');
    const learning = document.getElementById('learning').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'polarArea',
        data: {
            labels: ['Shape', 'Rodas', 'Truks'],
            datasets: [{
                label: 'Estoque',
                data: [1200, 1900, 3000],
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',                
                ],
               
            }]
        },
        options: {
            responsive: true,

        }
    });
    const myChar= new Chart(earning, {
        type: 'bar',
        data: {
            labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto','Setembro', 'Outubro', 'Novembro', 'Dezembro'],
            
            datasets: [{
                label: '#Vendas',
                data: [5200, 3000, 2300, 1500, 2100, 4000, 6000, 3100, 2200, 2800, 4032, 8000],
                backgroundColor: [                
                    'rgba(255, 99, 132, 1)',
                    'rgba(265, 32, 135, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(155, 132, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(753, 122, 255, 1)',
                    'rgba(25, 59, 624, 1)',
                    'rgba(175, 492, 598, 1)',
                    'rgba(15, 142, 225, 1)',
                    'rgba(20, 259, 164, 1)'
                ],
             
            }]
        },
        options: {
            responsive: true,

        }
    });

    const myChart2 = new Chart(learning, {
        type: 'bar',
        data: {
            labels: [ 'Crédito', 'Débito', 'Dinheiro'],
            datasets: [{
                label: '# Forma de Pagamento',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [                
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [               
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,

        }
    });    
    
    </script>
    <script>
        const main = document.querySelector('.main');
        const search = document.querySelector('.search');
        icon.onclick = function(){
            search.classList.toggle('active')
        }

    </script>
    
    
    
    </body>
</html>