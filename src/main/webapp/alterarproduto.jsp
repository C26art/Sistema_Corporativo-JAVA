<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração de Produtos</title>
<link rel="icon" href="img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
 rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <style>
 body{
    background: url(./img/Background1.png);
    transition: 0.5s;   
    }
    body.active{
    background: url(./img/Background2.png);
}
#toggle{
    position: relative;
    display: flex;
    float: right;
    margin-top: 10px;
    margin-right: 10px;
    width: 90px;
    height: 40px;
    border-radius: 160px;
    background: #0B5ED7;
    transition: 0.5s;
    cursor: pointer;
    box-shadow: inset 0 8px 60px rgba(0, 0, 0, 0.1),
                          inset 0 8px 8px rgba(0, 0, 0, 0.1),
                          inset 0 -4px 4px rgba(0, 0, 0, 0.1);
}
#toggle.active{
    background: #87c120;
    box-shadow: inset 0 2px 60px rgba(0, 0, 0, 0.1),
                          inset 0 2px 8px rgba(0, 0, 0, 0.1),
                          inset 0 -4px 4px rgba(0, 0, 0, 0.05);
}
#toggle .indicator{
    position: absolute;
    top: 0;
    left: 0;
    width: 40px;
    height: 40px;
    background: linear-gradient(to bottom, #444, #222);
    border-radius: 50%;
    transform: scale(0.9);
    box-shadow: 0 8px 40px rgba(0, 0, 0, 0.5),
                        inset 0 4px 4px rgba(255, 255, 255, 0.2),
                        inset 0 -4px 4px rgba(255, 255, 255, 0.2);
                        transition: 0.5s;
}
#toggle.active .indicator{
    left: 50px;
    background: linear-gradient(to bottom, #eaeaea, #f9f9f9);
    box-shadow: inset 0 8px 20px rgba(0, 0, 0, 0.1),
                          inset 0 4px 4px rgba(255, 255, 255, 1),
                          inset 0 -4px 4px rgba(255, 255, 255, 1);
}
    
.logo1{
  	float:left;
  	margin-left:10px;  
  }  
.container{
    margin-top: 20px;
    z-index: 1000;
    width: 100%;
    max-width: 1000px;
    padding: 50px;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.25);
    border-right: 1px solid rgba(255, 255, 255, 0.1);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    overflow: hidden;
    backdrop-filter: blur(25px);
}
 .row input[type="text"], 
 .row input[type="number"]{
  	
  	color:green;
  	font-size:16px;
  }

 </style>
</head>
<body>

	
	<div class="logo1">
            <img id="logo" src="img/Logo.png" width="190" height="120">
     </div>
        <div id="toggle">
        <i class="indicator"></i>
    </div>
    <div class="container">
		<div class="row">
			<div class="cold-md-7">				
					<h3 style="color: #0B5ED7; text-decoration: underline; text-align:center; font-weight:700; text-transform: uppercase; padding-top:20px">Formulário Alterar Produtos</h3>	
				<hr>
				<form name="frmCadastro" action="update">
				<div class="row">                           
                            <div class="col-sm-12 col-md-6">
                                <fieldset class="row">                                   
                                    <div class=" mb-3 col-md-8">
                                        <label for="txtIdProduto" class="form-label" style="color:#0B5ED7;font-weight:700; ">Código de Barras:</label>                                     
                                        <input type="number" name="idProduto"  class="form-control" id="alteraridProduto" required value="<% out.print(request.getAttribute("idProduto")); %>" />
                                    </div>                                           
                                    <div class="mb-3">
                                        <label for="alterarnome" style="color:#0B5ED7; font-weight:700;" class="form-label">Nome:</label>
                                        <input type="text" class="form-control" id="alterarnome" name="nome" value="<% out.print(request.getAttribute("nome")); %>" /> 
                                </div>
                                <div class="mb-3">
                                    <label for="alterarvalor" style="color:#0B5ED7; font-weight:700;" class="form-label">Valor Produto:</label>	
                                    <input type="text" class="form-control" id="alterarvalor" name="valor" value="<% out.print(request.getAttribute("valor")); %>" />                                      
                              </div>                                
                                </fieldset>                                   
                            </div>
                            <div class="col-sm-12 col-md-6">                               
                                  <div class="mb-3 col-md-8">
                                    <label for="alterardescricao" style="color:#0B5ED7; font-weight:700;" class="form-label">Descrição</label>	
				                	<input type="text" class="form-control" id="alterardescricao" name="descricao" value="<% out.print(request.getAttribute("descricao")); %>" /> 
                                </div>                                
                                    <div class="mb-3 col-md-8">
                                        <label for="alterarcategoria" style="color:#0B5ED7; font-weight:700;" class="form-label">Categoria</label>	
					        <input type="text" class="form-control" id="alterarcategoria" name="categoria" value="<% out.print(request.getAttribute("categoria")); %>" />                                    
                                      </div>
                                      </div>
                                      <div class="mb-3 col-md-8">
                                        <label for="alterarmarca" style="color:#0B5ED7; font-weight:700;" class="form-label">Marca</label>	
					<input type="text" class="form-control" id="alterarmarca" name="marca" value="<% out.print(request.getAttribute("marca")); %>" /> 
                                    </div>
                                        <div class=" mb-3 col-md-4">
                                            <label for="alterarquantidade" style="color:#0B5ED7; font-weight:700;" class="form-label">Quantidade</label>	
                                            <input type="number" class="form-control" id="alterarquantidade" name="quantidade" value="<% out.print(request.getAttribute("quantidade")); %>" />
                                      </div>                                      
                                </fieldset>                                                                            
                            </div>
                            <input type="submit" class="btn btn-success" style= "margin-top:10px;" value="Alterar"/>
                            <button class="btn btn-primary" method="post" action="index.jsp" type="submit" style="margin-top:10px;">Voltar</button> 
                           
                        </div>                       
                      </form>			
                    </div>	
                  </div>
                </div>
                </main>
                <script>
                    const body = document.querySelector('body');
                    const toggle = document.getElementById('toggle');
                    toggle.onclick = function(){
                        toggle.classList.toggle('active');
                        body.classList.toggle('active');
                    }
                </script>
                
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            </body>
            </html>