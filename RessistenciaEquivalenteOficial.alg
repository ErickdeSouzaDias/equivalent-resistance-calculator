algoritmo "Ressistencia equivalente"
// Fun��o :Retornar o valor de ressistencia eqivalente de um circuito
// Autor :Erick
// Data : 31/10/2021
// Se��o de Declara��es
var

res_ini, res_fin, equivalente, guardado: real
repete, cont:inteiro
uso_guard:caractere
opcao:inteiro

procedimento cabecalho()

inicio

// Secao de observalcoes
escreval("********************************************")
escreval("calculadora de ressistencia equivalente")
escreval("--------------------------------------------")
escreval()
escreval("Observacoes:")
escreval("*Nao use notacao cientifica")
escreval("*Use o ponto como separador de casas decimais")
escreval("*O sistema calcula dois resistores por vez")
escreval("O n�mero de n de ressistencias � sempre crescente")
escreval()
escreval("--------------------------------------------")
escreval()
escreval("Obrigado!")
escreval()
escreval("********************************************")
escreval()
escreval()


fimprocedimento  // Exibe o cabecalho do programa

procedimento Tipo_res() // funcao que define se os ressistores estao em serie
//ou paralelo
var

tipo:inteiro

inicio

escreval()
escreval("Qual o tipo de conexao:")
escreval()
escreval("1 - Ressistores em serie")
escreval("2 - Ressistores em paralelo")
repita
   escreval()
   escreva("Opicao: ")
   leia(tipo)
   escreval()

   se ((tipo <> 1) e (tipo <> 2)) entao
      escreval()
      escreval("Opcao Invalida! Tente novamente.")
      escreval()
   fimse
ate ((tipo = 1) ou (tipo = 2))    // Verifica se a opcao e valida

se (tipo = 1) entao

   res_serie(res_ini) //Chamada para funcao que calcula ressistencia equivalente
   //em serie, passando como parametro o valor de ressistenci
   //inicial

senao

   se (tipo = 2) entao

      res_paralelo(res_ini) //Chamada para funcao que calcula ressistencia equivalente
      //em paralelo, passando como parametro o valor de ressistenci
      //inicial


   fimse
fimse

fimprocedimento   // Procedimento para informar ao programa o tipo de ligacao
// dos ressistores

procedimento res_serie(variavel:real)

var

//opcao:inteiro

inicio

se (uso_guard = "USO") entao
   equivalente <- res_ini+res_fin
   res_ini <- equivalente
   uso_guard <-  ""
   escreval("Pronto! Resistencia equivalente atualizada.")
   escreval("Agora � com voce.")
   exibe_opc()
fimse  //Tratamento de erro para evitar que a ressistencia equivalente esteja
//errada, quando se usar uma valor em meoria

se (repete = 1) entao
   interrompa
fimse

repita
   escreva("Informe o valor da ressistencia",cont," em serie: ")
   leia(res_fin)
   se (res_fin <= 0) entao
      escreval("Valor invalido! Informe uma ressistecia maior que 0.")
      escreval("Tente novamente.")
   fimse
ate (res_fin > 0)
cont <- cont+1

equivalente <- res_ini+res_fin

exibe_opc()


fimprocedimento

procedimento res_paralelo(variavel2:real) //Procedimento para calcular a
// resistencia equivalente em paralelo.
var
//opcao:inteiro
inicio

se (uso_guard = "USO") entao //Procediemnto que verifica a necessidade de atuali
//zacao da resistencia equivalnete.
equivalente <- 1/((1/res_ini)+(1/res_fin))
res_ini <- equivalente
uso_guard <-  ""
escreval("Pronto! Resistencia equivalente atualizada.")
escreval("Agora � com voce.")
exibe_opc()
fimse

se (repete = 1) entao
   interrompa
fimse

escreval()
repita
escreva("Informe o valor da ressistencia",cont," em paralelo: ")
leia(res_fin)
se (res_fin <= 0) entao
   escreval("Valor invalido! Informe uma ressistecia maior que 0.")
   escreval("Tente novamente.")
fimse
ate (res_fin > 0)
escreval()
cont <- cont+1

equivalente <- 1/((1/res_ini)+(1/res_fin))

exibe_opc()

fimprocedimento

procedimento exibe_equivalente()
inicio
escreval()
escreval("A ressistencia equivalente �",equivalente)
escreval()
repete <- 1

fimprocedimento // Exibe o valor da ressistencia equivalente

procedimento exibe_opc()
inicio

escreval()
escreval("Deseja continuar: ")
escreval()
escreval("1 - Parar programa e exibir ressitencia equivalente")
escreval("2 - Continuar calculado ressistencia equivalente")
escreval("3 - Guardar valor  na memoria para uso futuro e zerar ressistencias")
escreval("4 - Usar valor guaradado na memoria")
escreval()
repita
escreva("Opcao: ")
leia(opcao)
escreval()

se ((opcao <> 1) e (opcao <> 2) e (opcao <> 3) e (opcao <> 4)) entao
limpatela()
escreval("Opcao invalida! Tente novamente.")
fimse
ate ((opcao = 1) ou (opcao = 2) ou (opcao = 3) ou (opcao = 4))
se (opcao = 1) entao
exibe_equivalente()
senao
se (opcao = 2) entao
limpatela()
res_ini <- equivalente
Tipo_res()
senao
se (opcao = 3) entao
   limpatela()
   escreval("MEMORIA LIMPA")
   guardado <- equivalente
   equivalente <- 0
   res_ini <- 0
   res_fin <- 0
   escreval()
   escreva("Informe o valor da ressistencia",cont,": ")
   leia(res_ini)
   escreval()
   tipo_res()
senao
   se (opcao = 4) entao
      se (guardado <> 0) entao
         limpatela()
         res_ini <- guardado
         res_fin <- equivalente
         uso_guard <- "USO"
         escreval("Equivalente deve ser atualizado!")
         escreval()
         escreval("Para isso informe se o valor armazenado em memoria,")
         escreval("e que sera usado agora, esta associado em serie")
         escreval("ou em paralelo com o circuito")
         escreval("Logo apos atualizar a resistencia equivalente")
         escreval("o progrma ira continuar normalmente.")
         tipo_res()
      senao
         limpatela()
         escreval("Voce nao possui valor guardado em memoria!")
         escreval()
         escreval("Por favor, tente novamente!")
         escreval()
         exibe_opc()
      fimse
   fimse
fimse
fimse
fimse
fimprocedimento

inicio
// Se��o de Comandos

repete <- 0 // Variavel de controle do laco de repeticao
cont <- 1 // Apenas para o usuario saber qual resistencia esta sendo solicitada
uso_guard <- ""


cabecalho()

repita

escreva("Informe a ressistencia", cont,": ")
leia(res_ini)
cont <- cont+1
escreval()

Tipo_res()

ate (repete = 1)// Executa o programa em loop

fimalgoritmo
