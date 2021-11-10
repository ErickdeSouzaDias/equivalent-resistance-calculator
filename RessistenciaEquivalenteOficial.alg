algoritmo "Ressistencia equivalente"
// Função :Retornar o valor de ressistencia eqivalente de um circuito
// Autor :Erick
// Data : 31/10/2021
// Seção de Declarações
var

res_ini, res_fin, equivalente, guardado: real
repete, cont:inteiro
uso_guard:caractere

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
escreval("O número de n de ressistencias é sempre crescente")
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
limpa_tela()
fimprocedimento   // Procedimento para informar ao programa o tipo de ligacao
// dos ressistores

procedimento res_serie(variavel:real)

var

opcao:inteiro

inicio

se (uso_guard = "USO") entao
   equivalente <- res_ini+res_fin
   res_ini <- equivalente
   uso_guard <-  ""
   tipo_res()
fimse  //Tratamento de erro para evitar que a ressistencia equivalente esteja
//errada, quando se usar uma valor em meoria
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

escreval()
escreval("Deseja continuar: ")
escreval()
escrevaL("1 - Parar programa e exibir ressitencia equivalente")
escreval("2 - Continuar calculado ressistencia equivalente")
escreval("3 - Guardar valor  na memoria para uso futuro e zerar ressistencias")
escreval("4 - Usar valor guaradado na memoria")
escreval()
repita
   escreva("Opcao: ")
   leia(opcao)
   escreval()

   se ((opcao <> 1) e (opcao <> 2) e (opcao <> 3) e (opcao <> 4)) entao
      escreval("Opcao invalida! Tente novamente.")
   fimse
ate ((opcao = 1) ou (opcao = 2) ou (opcao = 3) ou (opcao = 4))
se (opcao = 1) entao
   exibe_equivalente()
senao
   se (opcao = 2) entao
      res_ini <- equivalente
      Tipo_res()
   senao
      se (opcao = 3) entao
         escreval("MEMORIA LIMPA")
         guardado <- equivalente
         equivalente <- 0
         res_ini <- 0
         res_fin <- 0
         escreval()
         escreva("Informe o valor da ressistencia",cont,": ")
         leia(res_ini)
         tipo_res()
      senao
         se (opcao = 4) entao
            se (guardado <> 0) entao
               res_ini <- guardado
               res_fin <- equivalente
               uso_guard <- "USO"
               escreval("Equivalente deve ser atualizado!")
               escreval()
               escreval("Para isso informe se o valor armazenado em memoria,")
               escreval("e que sera usado agora, esta associado em serie")
               escreval("ou em paralelo com o circuito")
               tipo_res()
            senao
               escreval("Voce nao possui valor guardado em memoria!")
               escreval()
               escreval("O último valor de ressistencia informado,", res_fin)
               escreval("sera apagado!")
               escreval()
               escreval("Caso deseje reutilizalo informeo novamente")
               escreval("no proximo passo")
               escreval()
               res_serie(res_ini)
            fimse
         fimse
      fimse
   fimse
fimse
fimprocedimento

procedimento res_paralelo(variavel2:real)
var
opcao:inteiro
inicio

se (uso_guard = "USO") entao
   equivalente <- 1/((1/res_ini)+(1/res_fin))
   res_ini <- equivalente
   uso_guard <-  ""
   tipo_res()
fimse

//equivalente <- 1/((1/res_ini)+(1/res_fin))
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
      escreval("Opcao invalida! Tente novamente.")
   fimse
ate ((opcao = 1) ou (opcao = 2) ou (opcao = 3) ou (opcao = 4))
se (opcao = 1) entao
   exibe_equivalente()
senao
   se (opcao = 2) entao
      res_ini <- equivalente
      Tipo_res()
   senao
      se (opcao = 3) entao
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
               res_ini <- guardado
               res_fin <- equivalente
               uso_guard <- "USO"
               escreval("Equivalente deve ser atualizado!")
               escreval()
               escreval("Para isso informe se o valor armazenado em memoria,")
               escreval("e que sera usado agora, esta associado em serie")
               escreval("ou em paralelo com o circuito")
               tipo_res()
            senao
               escreval("Voce nao possui valor guardado em memoria!")
               escreval()
               escreval("O último valor de ressistencia informado,", res_fin)
               escreval("sera apagado!")
               escreval()
               escreval("Caso deseje reutilizalo informeo novamente")
               escreval("no proximo passo")
               escreval()
               res_paralelo(res_ini)
            fimse
         fimse
      fimse
   fimse
fimse

fimprocedimento

procedimento exibe_equivalente()
inicio
escreval()
escreval("A ressistencia equivalente é",equivalente)
escreval()
repete <- 1
fimprocedimento // Exibe o valor da ressistencia equivalente

procedimento limpa_tela()
var
cont:inteiro
inicio
cont <- 1
repita
      escreval()
      cont <- cont + 1
ate (cont = 22)

fimprocedimento

inicio
// Seção de Comandos

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
