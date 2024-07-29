function mascaraMutuario(o,f){
    v_obj=o
    v_fun=f
    setTimeout('execmascara()',1)
}

function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}



function Nome(v) {

    //Remove tudo o que não é dígito
    //v = v.replace(/\D/g, "")

    //Coloca o traço 
    //v = v.replace(/^(\d{5})(\d)/, "$1-$2")

    // Retira Aspas Simples
    v = v.replace("'", "")

    // Retira Aspas Duplas
    v = v.replace('"', "");

    // Retira Digitos e caracteres especiais
    v = v.normalize('NFD').replace(/[\u0300-\u036f]/g, "");
    v = v.replace(/[^A-Za-z ]+/g, '');

    return v

} 

function cpfCnpj(v){
 
    //Remove tudo o que não é dígito
    v=v.replace(/\D/g,"")
 
    if (v.length <= 14) { //CPF
 
        //Coloca um ponto entre o terceiro e o quarto dígitos
        v=v.replace(/(\d{3})(\d)/,"$1.$2")
 
        //Coloca um ponto entre o terceiro e o quarto dígitos
        //de novo (para o segundo bloco de números)
        v=v.replace(/(\d{3})(\d)/,"$1.$2")
 
        //Coloca um hífen entre o terceiro e o quarto dígitos
        v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
 
    } else { //CNPJ
 
        //Coloca ponto entre o segundo e o terceiro dígitos
        v=v.replace(/^(\d{2})(\d)/,"$1.$2")
 
        //Coloca ponto entre o quinto e o sexto dígitos
        v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
 
        //Coloca uma barra entre o oitavo e o nono dígitos
        v=v.replace(/\.(\d{3})(\d)/,".$1/$2")
 
        //Coloca um hífen depois do bloco de quatro dígitos
        v=v.replace(/(\d{4})(\d)/,"$1-$2")
 
    }
 
    return v
  }  
    
  function CnpjAnt(v)

  {
 
    //Remove tudo o que não é dígito
    v=v.replace(/\D/g,"")
 
    //Coloca ponto entre o segundo e o terceiro dígitos
    v=v.replace(/^(\d{2})(\d)/,"$1.$2")
   
    //Coloca ponto entre o quinto e o sexto dígitos
    v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
 
    //Coloca uma barra entre o oitavo e o nono dígitos
    v=v.replace(/\.(\d{3})(\d)/,".$1/$2")
 
    //Coloca um hífen depois do bloco de quatro dígitos
    v=v.replace(/(\d{4})(\d)/,"$1-$2")
 
  
    return v
  }


  function Cnpj(v) {

      //Remove tudo o que não é dígito
      v = v.replace(/\D/g, "")

      //Coloca ponto entre o segundo e o terceiro dígitos
      v = v.replace(/^(\d{2})(\d)/, "$1.$2")

      //Coloca ponto entre o quinto e o sexto dígitos
      v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")

      //Coloca uma barra entre o oitavo e o nono dígitos
      v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")

      //Coloca um hífen depois do bloco de quatro dígitos
      v = v.replace(/(\d{4})(\d)/, "$1-$2")


      return v
  }


  function Cep(v)

  {

    //Remove tudo o que não é dígito
    v=v.replace(/\D/g,"")
 
    //Coloca o traço 
    v=v.replace(/^(\d{5})(\d)/,"$1-$2")
  
    return v
}


function mtel(v) {

    //Remove tudo o que não é dígito
    v = v.replace(/\D/g, "")

    //Coloca ponto entre o segundo e o terceiro dígitos
    v = v.replace(/^(\d{2})(\d)/, "($1)$2")

    return v
}



  function validarCNPJ(cnpj) {

      cnpj = cnpj.replace(/[^\d]+/g, '');

      if (cnpj == '') return false;

      if (cnpj.length != 14)
          return false;

      // Elimina CNPJs invalidos conhecidos
      if (cnpj == "00000000000000" ||
        cnpj == "11111111111111" ||
        cnpj == "22222222222222" ||
        cnpj == "33333333333333" ||
        cnpj == "44444444444444" ||
        cnpj == "55555555555555" ||
        cnpj == "66666666666666" ||
        cnpj == "77777777777777" ||
        cnpj == "88888888888888" ||
        cnpj == "99999999999999")
          return false;

      // Valida DVs
      tamanho = cnpj.length - 2
      numeros = cnpj.substring(0, tamanho);
      digitos = cnpj.substring(tamanho);
      soma = 0;
      pos = tamanho - 7;
      for (i = tamanho; i >= 1; i--) {
          soma += numeros.charAt(tamanho - i) * pos--;
          if (pos < 2)
              pos = 9;
      }
      resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
      if (resultado != digitos.charAt(0))
          return false;

      tamanho = tamanho + 1;
      numeros = cnpj.substring(0, tamanho);
      soma = 0;
      pos = tamanho - 7;
      for (i = tamanho; i >= 1; i--) {
          soma += numeros.charAt(tamanho - i) * pos--;
          if (pos < 2)
              pos = 9;
      }
      resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
      if (resultado != digitos.charAt(1))
          return false;

      return true;

  }

  function validarCPF(cpf) {
      var numeros, digitos, soma, i, resultado, digitos_iguais;
      digitos_iguais = 1;

      cpf = cpf.replace(/[^\d]+/g, '');

      if (cpf.length < 11)
          return false;
      for (i = 0; i < cpf.length - 1; i++)
          if (cpf.charAt(i) != cpf.charAt(i + 1)) {
              digitos_iguais = 0;
              break;
          }
      if (!digitos_iguais) {
          numeros = cpf.substring(0, 9);
          digitos = cpf.substring(9);
          soma = 0;
          for (i = 10; i > 1; i--)
              soma += numeros.charAt(10 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(0))
              return false;
          numeros = cpf.substring(0, 10);
          soma = 0;
          for (i = 11; i > 1; i--)
              soma += numeros.charAt(11 - i) * i;
          resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
          if (resultado != digitos.charAt(1))
              return false;
          return true;
      }
      else
          return false;
  }

  function Inteiro(v) {

      //Remove tudo o que não é dígito
      v = v.replace(/\D/g, "")

      return v
  }


function Decimal(v,d) {

    //Remove tudo o que não é dígito
    v = v.replace(/\D/g, "").toFixed(d)

    return v
}

  function ModalMessage(pMessage) {
      bootbox.dialog({
          message: "<span class='bigger-110'>"+pMessage+"</span>",
          buttons:
			{
			    /*"success":
				 {
				     "label": "<i class='icon-ok'></i> Success!",
				     "className": "btn-sm btn-success",
				     "callback": function () {
				         //Example.show("great success");
				     } 
				 },*/
			    "danger":
				{
				    "label": "Ok",
				    "className": "btn-sm btn-danger",
				    "callback": function () {
				        //Example.show("uh oh, look out!");
				    } 
				}/*,
			    "click":
				{
				    "label": "Click ME!",
				    "className": "btn-sm btn-primary",
				    "callback": function () {
				        //Example.show("Primary button");
				    } 
				},
			    "button":
				{
				    "label": "Just a button...",
				    "className": "btn-sm"
				}*/
			}
      })
};

