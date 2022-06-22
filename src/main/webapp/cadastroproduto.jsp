<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Produtos" %>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro Produto</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
 <link rel="icon" href="img/favicon.ico">
 <link rel="stylesheet" href="./css/estilo.css">  
 
 <script>
                  setInterval(( ) =>{
                  let hours = document.getElementById('hours');
                  let minutes = document.getElementById('minutes');
                  let seconds = document.getElementById('seconds');
                  let ampm = document.getElementById('ampm');
          
                  let hh = document.getElementById('hh');
                  let mm = document.getElementById('mm');
                  let ss = document.getElementById('ss');
                  
                  let hr_dot = document.querySelector('.hr_dot');
                  let min_dot = document.querySelector('.min_dot');
                  let sec_dot = document.querySelector('.sec_dot');
          
          
                  let h = new Date().getHours();
                  let m = new Date().getMinutes();
                  let s = new Date().getSeconds();
                  let am = h >= 12 ? "PM" : "AM";
          
                  if (h > 12){
                    h = h -12;
                  }
                  
                  h = (h < 10) ? "0" + h : h;
                  m = (m < 10) ? "0" + m : m;
                  s = (s < 10) ? "0" + s : s;
                  
                  hours.innerHTML = h + "<br><span>Horas</span>";
                  minutes.innerHTML = m + "<br><span>Minutos</span>";
                  seconds.innerHTML = s + "<br><span>Segundos</span>";
                  ampm.innerHTML = am;
          
                  hh.style.strokeDashoffset = 314 - (314 * h) / 12 ;
                  mm.style.strokeDashoffset = 314 - (314 * m) / 60 ;
                  ss.style.strokeDashoffset = 314 - (314 * s) / 60 ;
          
                  hr_dot.style.transform = `rotate(${h * 30}deg)`;
                  min_dot.style.transform = `rotate(${m * 6}deg)`;
                  sec_dot.style.transform = ` rotate(${s * 6}deg) `;
            }) 
            
          </script>
          
          <style>
          /* Relógio*/
 #time{
    display: flex;
    gap: 20px;
    color: #677eff;
}
#time .circle{
    position: relative;
    width: 150px;
    height: 150px;
    display: flex;
    justify-content: center;
    align-items: center;
}
#time .circle svg{
    position: relative;
    width: 150px;
    height: 150px;
    transform: rotate(270deg);
}

#time .circle svg circle{
    width: 100%;
    height: 100%;
    fill: transparent;
    stroke: #191919;
    stroke-width: 4;
    transform: translate(25px, 25px);
}

#time .circle svg circle:nth-child(2){
    stroke: var(--clr);
    stroke-dasharray: 314;
}

#time div{
    position: absolute;
    text-align: center;
    font-weight: 500;
    font-size: 1.2em;
}
#time div span{
    position: absolute;
    transform: translateX(-50%) translateY(10px);
    font-size: 0.35em;
    font-weight: 300;
    letter-spacing: 0.1em;
    text-transform: uppercase;
}
#time .ap{
    position: relative;
    font-size: 1em;
    transform: translateX(-30px);
}
.dots{
    position: absolute;
    width: 100%;
    height: 100%;     
    z-index: 10;
    display: flex;
    justify-content: center;    
}
.dots::before{
    content: "";
    position: absolute;
    top: 20px;
    width: 10px;
    height: 10px;
    background: var(--clr);
    border-radius: 50%;
    box-shadow: 0 0 20px var(--clr),
    0 0 60px var(--clr);    
}        


.navbar{
 	background-image: url(./img/explore1.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
 	padding-bottom:19px;
    border-bottom: 1px solid rgb(235, 202, 140);
 } 
 
          
 </style>
 
</head>	 



<body>
	<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="cadastroproduto.jsp"><img id="logo" src="img/Logo.png" width="130" height="90"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;" 
           href="indexFunc.jsp">Funcionários</a>          
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;"
             href="cadastrocontroleentrada.jsp">Relatório Entrada</a>            
          </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;"
           href="cadastrocontrolesaida.jsp">Relatório Saída</a>    
        </li>
         <li class="nav-item">
            <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;"
             href="indexfornecedor.jsp">Fornecedores</a>            
          </li>        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;" 
          href="login.jsp">Administrativo</a>          
        </li>      
      </ul>
      <form action="main" class="d-flex">    
         <div class="search">
        <div class="icon"></div>
        <div class="input">
            <input type="text" placeholder="pesquisar..." id="mysearch">
        </div>
        <span class="clear" onclick="document.getElementById('mysearch').value = '' "></span>
    </div>
      </form>
    </div>
  </div>
</nav>
<div class="container">
		<div class="row">
			<div class="cold-md-7">				
					<h3 style="color: #0B5ED7; text-decoration: underline; text-align:center; font-weight:700; text-transform: uppercase; padding-top:20px">Cadastro de Produtos</h3>	
				<hr>
					<form name="frmCadstro" action="insert">
                        <div class="row">                           
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">
                                    <legend style="color:rgb(134, 97, 97); font-weight:bold">Dados dos Produtos:</legend>
                                    <div class=" mb-3 col-md-8">
                                        <label for="txtcodBarra" class="form-label" style="color:#0B5ED7;font-weight:700; ">Código Produtos:</label>                                     
                                        <select name="idProduto" id="idProduto" onChange=" atualizouSelect()" autofocus>
        								  <option value="0" selected disabled>Selecione o Produto</option>
                                          <option value ="1">Shape Tron</option>
                                          <option value ="2">Roda Sims</option>
                                          <option value ="3">SKate Power Peralta</option>
                                          <option value ="4">Rolamento NHBB</option>
                                          <option value ="5">Shape Element</option>
                                          <option value ="6">Shape Urgh</option>
    								   </select>
                                    </div>                                           
                                    <div class="mb-3">
                                    <label for="txtNome" class="form-label" style="color:#0B5ED7; font-weight:700; ">Nome:</label>
                                    <input type ="text" name="nomeproduto" maxlength="50" class="form-control" id="floatingInput1" required> 
                                </div>
                                <div class="mb-3">
                                  <label for="txtValor" class="form-label" style="color:#0B5ED7; font-weight:700; ">Valor:</label>
                                  <input type ="number" name="valorproduto" class="form-control" id="txtValor" required>                                      
                              </div>  
                               <div class="mb-3 col-md-4">
                                        <label for="txtCategoria" class="form-label" style="color:#0B5ED7; font-weight:700; ">Categoria:</label>
                                        <div class="input-group">
                                            <input type ="text" name="categoriaproduto" maxlength="50" class="form-control" id="txtCategoria">                                    
                                      </div>
                                      </div>                              
                                </fieldset>                                   
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">
								                   <legend style="color:rgb(134, 97, 97); font-weight:bold">Sobre o Produto:</legend>
                                  <div class="mb-3 col-md-8">
                                    <label for="txtDescricao" class="form-label" style="color:#0B5ED7; font-weight:700; ">Descrição</label>
                                    <input type ="text" name="descricaoproduto" maxlength="50" class="form-control" id="txtDescricao" required> 
                                </div>                                
                                   
                                      <div class="mb-3 col-md-10">
                                        <label for="txtMarca" class="form-label" style="color:#0B5ED7; font-weight:700; ">Marca:</label>
                                        <input type ="text" name="marcaproduto" maxlength="50" class="form-control" id="txtMarca" required> 
                                    </div>
                                        <div class=" mb-3 col-md-8">
                                          <label for="txtQuantidade" class="form-label" style="color:#0B5ED7;font-weight:700; ">Quantidade:</label>                                     
                                          <input type="number" name="quantidadeproduto"  class="form-control" id="txtQuantidade" required>
                                      </div>
                                      
                                      
                                  <div id="time">
                                    <div class="circle" style="--clr:#0b5ed7;">
                                        <div class="dots hr_dot"></div>
                                        <svg>
                                            <circle cx="50" cy="50" r="50"></circle>
                                            <circle cx="50" cy="50" r="50" id="hh"></circle>
                                        </svg>
                                        <div id="hours">00</div>
                                    </div>
                                    <div class="circle" style="--clr:#87c120;">
                                        <div class="dots min_dot"></div>
                                        <svg>
                                            <circle cx="50" cy="50" r="50"></circle>
                                            <circle cx="50" cy="50" r="50" id="mm"></circle>
                                        </svg>
                                        <div id="minutes">00</div>
                                    </div>
                                    <div class="circle" style="--clr:#fee800;">
                                        <div class="dots sec_dot"></div>
                                        <svg>
                                            <circle cx="50" cy="50" r="50"></circle>
                                            <circle cx="50" cy="50" r="50" id="ss"></circle>
                                        </svg>
                                        <div id="seconds">00</div>
                                    </div>
                                    <div class="ap">
                                        <div id="ampm">AM</div>
                                    </div>
                                </div>                                                                          
                              </div>                                  
                            </fieldset>                                                                             
                            </div>

					<button class="btn btn-success" type="submit">Cadastrar</button>
					<button class="btn btn-primary" type="reset">Limpar</button>
					<input type="submit" class="btn btn-warning" value="Alterar"/>
					<a href="index.jsp" type="submit" class="btn btn-danger">DashBoard</a>					
					 </div>                       
                      </form>			
                    </div>	
                  </div>
                    
                    
		
<script>
        const icon = document.querySelector('.icon');
        const search = document.querySelector('.search');
        icon.onclick = function(){
            search.classList.toggle('active')
        }

    </script>
    
    <script>  
        function atualizouSelect(){
            let select = document.querySelector('#idProduto');
            let optionValue = select.options[select.selectedIndex];

            let value = optionValue.value;
            let text = optionValue.text;
            console.log(value, text)
        }
            atualizouSelect()
    </script>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		
 
 
</body>
</html>