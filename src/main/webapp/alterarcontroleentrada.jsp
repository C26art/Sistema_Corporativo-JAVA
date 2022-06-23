<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.ControleEntrada" %>
<%@ page import="model.Conexao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração Controle Entrada de Produtos</title>
<link rel="icon" href="img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
 rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
<style>
body{
    background: url(./img/Background.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;   
    background-position: center;
    transition: 0.5s;   
    }  
    .form-control{
        background: transparent;
        border: none;
        border-bottom: 2px solid rgba(255, 255, 255, .3);
        height: 50px;
        border-radius: 10px;
        background: rgba(0, 0, 0, 0.1);
        color: #FFF;
        font-size: 1.25rem;
        font-weight: 700;
    }
    .form-control:focus,
    .contato .form-control:hover {
    border: none;
    border-bottom: 2px solid rgba(255, 255, 255, .1);
    box-shadow: none;
}
.change{
    position: relative;
    display: inline-block;
    padding: 8px 24px;
    margin: 10px 0px;
    color: #fff;
    text-decoration: none;
    text-transform: uppercase;
    font-size: 18px;
    letter-spacing: 2px;
    border-radius: 8px;
    overflow: hidden;
    background: linear-gradient(90deg,#122b53,#345d63);
}
.change:nth-child(2){
    background: linear-gradient(90deg,#ff7f50,#f28123);
}
span{
    position: absolute;
    background: #fff;
    transform: translate(-50%, -50%);
    pointer-events: none;
    border-radius: 50%;
    animation: animate 1s linear infinite;
}
@keyframes animate{
    0%{
        width: 0px;
        height: 0px;
        opacity: 0.5;
    }
    100%{
        width: 500px;
        height: 500px;
        opacity: 0;
    }
} 

  .logo1{
  	float:left;    
  	margin-left:5px;  
  }  
.container{
    margin-top: 100px;
    z-index: 1000;
    width: 100%;
    max-width: 1000px;
    padding: 50px;
    background: rgba(255, 255, 255, .2);
    box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
    border: 1px solid rgba(255, 255, 255, 0.25);
    border-right: 1px solid rgba(255, 255, 255, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    overflow: hidden;
    align-items: center;
    justify-content: center;
    
}
.row input[type="text"], 
  .row input[type="number"]{
  	
  	color:#051922;
  	font-size:16px;
  }
</style> 
</head>
    <body>        
        <%
        ControleEntrada entradaAlterar = (ControleEntrada) request.getAttribute("controleEntrada");			
        %>


        <div class="logo1">
            <img id="logo" src="img/Logo.png" width="80" height="60">
     </div>
      
    <div class="container">
		<div class="row">
			<div class="cold-md-7">				
					<h3 style="color: #f28123; text-decoration: underline; text-align:center; font-weight:700; text-transform: uppercase; padding-top:20px">Formulário Alterar Controle Entrada de Produtos</h3>	
				<hr>
                <form class="form" method="post" action="ExecutaAlteraControleEntrada">
                        <div class="row">                           
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">                                   
                                    <div class=" mb-3 col-md-10">
                                        <label for="txtcodBarra" class="form-label" style="color:#f28123;font-weight:700; ">Código de Barras:</label>                                     
                                        <input type="number" name="idEntrada"  class="form-control" id="alterarid" required value="<%= entradaAlterar.getIdEntrada() %>" />
                                    </div>                                           
                                    <div class="mb-3 col-md-10">
                                        <label for="alterarnome" style="color:#f28123; font-weight:700;" class="form-label">Quantidade Entrada:</label>
                                        <input type="text" class="form-control" id="alterarquantidadeentradacontroleentrada" name="quantidadeentradacontroleentrada" value="<%= entradaAlterar.getQuantidadeEntrada() %>" /> 
                                </div>
                                <div class="mb-3 col-md-10">
                                    <label for="alterarfornecedor" style="color:#f28123; font-weight:700;" class="form-label">Data Entrada:</label>	
                                    <input type="text" class="form-control" id="alterardataentrada" name="dataentradacontroleentrada" value="<%= entradaAlterar.getDataEntrada() %>" />                                      
                              </div>                                
                                </fieldset>                                   
                            </div>
                            <div class="col-sm-12 col-md-6">                               
                                  <div class="mb-3 col-md-10">
                                    <label for="alterardesconto" style="color:#f28123; font-weight:700;" class="form-label">Nome Produto:</label>	
				                	<input type="text" class="form-control" id="alterarnomeprodutocontroleentrada" name="nomeprodutocontroleentrada" value="<%= entradaAlterar.getNomeProdutoEntrada() %>" /> 
                                </div>                                
                                    <div class="mb-3 col-md-10">
                                        <label for="alterarcategoria" style="color:#f28123; font-weight:700;" class="form-label">Valor:</label>	
                                        <input type="text" class="form-control" id="alterarvalor" name="valorprodutocontroleentrada" value="<%= entradaAlterar.getValorProduto() %>" />                                    
                                      </div>
                                      <div class="mb-3 col-md-10">
                                        <label for="alterarlocalizacao" style="color:#f28123; font-weight:700;" class="form-label">Código Produto:</label>	
                                        <input type="text" class="form-control" id="alterarcodproduto" name="idprodutocontroleentrada" value="<%= entradaAlterar.getProdutos() %>" /> 
                                    </div>
                                      </div>
                                      
                                </fieldset>                                                                            
                            </div>
                            <a class="change" value="Alterar" href="listarcontroleentrada.jsp">Alterar</a>
                            <a class="change" href="cadastrocontroleentrada.jsp">Voltar</a>                          
                        </div>                       
                      </form>			
                    </div>	
                  </div>
                </div>
                </main>   
                <script type="text/javascript">
      
                    const buttons = document.querySelectorAll('.change');
                    buttons.forEach(btn => {
                      btn.addEventListener('click' , function(e) {
              
                          let x = e.clientX - e.target.offsetLeft;
                          let y = e.clientY - e.target.offsetTop;
              
                          let ripples = document.createElement('span');
                          ripples.style.left = x + 'px';
                          ripples.style.top = y + 'px';
                          this.appendChild(ripples);
              
                          setTimeout(() => {
                              ripples.remove()
                          }, 1000)
                      })
                    })
              
                  </script>           
                
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            </body>
            </html>