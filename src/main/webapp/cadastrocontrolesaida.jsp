<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Produtos" %>	
<%@ page import="model.ControleSaida" %>
<%@ page import="br.com.controller. ControleSaidaController" %>
<%@ page import="controller.Controller" %>
<%@ page import="br.com.controller.ProdutoController" %>
<%@ page import="DAO.ProdutoDao" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro Controle Saida</title> 
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
          /* Rel??gio*/
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
    <a class="navbar-brand" href="cadastrocontrolesaida.jsp"><img id="logo" src="img/Logo.png" width="130" height="90"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;" 
           href="indexFunc.jsp">Funcion??rios</a>          
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;"
             href="cadastrocontroleentrada.jsp">Relat??rio Entrada</a>            
          </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color:#0B5ED7;font-size:20px;"
           href="cadastroproduto.jsp">Produtos</a>    
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
      <form action="listarcontrolesaida.jsp" class="d-flex">    
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
					<h3 style="color: #0B5ED7; text-decoration: underline; text-align:center; font-weight:700; text-transform: uppercase; padding-top:20px">Cadastro Controle de Saida Produtos</h3>	
				<hr>
					<form method="post" action="ControleSaidaServlet">
                        <div class="row">                           
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">
                                    <legend style="color:#f28123; font-weight:bold">Dados Saida Produtos:</legend>
                                    <div class=" mb-3 col-md-8">
                                        <label for="txtcodBarra" class="form-label" style="color:#0B5ED7;font-weight:700; ">C??digo de Barras:</label>                                     
                                        <input type="number" name="codigobarracontrolesaida"  class="form-control" id="txtcodBarra" required>
                                    </div>                                           
                                    <div class="mb-3">
                                    <label for="txtEstoque" class="form-label" style="color:#0B5ED7; font-weight:700; ">Estoque:</label>
                                    <input type ="text" name="estoquecontrolesaida" maxlength="50" class="form-control" id="floatingInput1" required> 
                                </div>
                                <div class="mb-3">
                                  <label for="txtValor" class="form-label" style="color:#0B5ED7; font-weight:700; ">Valor:</label>
                                  <input type ="number" name="valorcontrolesaida" class="form-control" id="txtValor" required>                                      
                              </div> 
                              <div class="mb-3 col-md-8">
                                    <label for="txtDesconto" class="form-label" style="color:#0B5ED7; font-weight:700; ">Desconto:</label>
                                    <input type ="number" name="descontocontrolesaida" maxlength="50" class="form-control" id="txtDesconto" required> 
                                </div>                               
                                </fieldset>                                   
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">
								    <legend style="color:#f28123; font-weight:bold">Sobre a Saida Produto:</legend>
								 <div class="mb-3 col-md-8">
                                    <label for="txtDataSaida" class="form-label" style="color:#0B5ED7; font-weight:700; ">Data Saida:</label>
                                    <input type ="date" name="datasaidacontrolesaida" maxlength="50" class="form-control" id="txtdataSaida" required> 
                                </div>                                                                   
                                      <div class="mb-3 col-md-10">                                      
                                        <label for="txtidProduto" class="form-label" style="color:#0B5ED7; font-weight:700; ">C??d Produto:</label>
                                        <select name="idProduto" id="idProduto" onChange="update()">
        								  <option value="0" selected disabled>Selecione o Produto</option>
                                          <option value ="1">Shape Tron</option>
                                          <option value ="2">Roda Sims</option>
                                          <option value ="3">SKate Powell Peralta</option>
                                          <option value ="4">Rolamento NHBB</option>
                                          <option value ="5">Shape Element</option>
                                          <option value ="6">Shape Urgh</option>	   
                                   
                                          <% 
                                          ProdutoController controller = new ProdutoController();
                                          ArrayList<Produtos> lista = controller.listar();
                                          for(Produtos p: lista){
                                          %>
                                          <option value="<%= p.getIdProduto() %>"> <%= p.getNome() %> </option>
                                          <% } %>
                                        </select> 
                                        <input type="text" id="value">
									   <input type="text" id="text">                                                                     
                                    </div>
                                        <div class=" mb-3 col-md-8">
                                          <label for="txtQuantidade" class="form-label" style="color:#0B5ED7;font-weight:700; ">Quantidade:</label>                                     
                                          <input type="number" name="quantidadesaidacontrolesaida"  class="form-control" id="txtQuantidade" required>
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
                                    <div class="circle" style="--clr:#f28123;">
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
    
    <script type="text/javascript">
			function update() {
				var select = document.getElementById('idProduto');
				var option = select.options[select.selectedIndex];

				document.getElementById('value').value = option.value;
				document.getElementById('text').value = option.text;
			}

			update();
		</script>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		
 
 
</body>
</html>