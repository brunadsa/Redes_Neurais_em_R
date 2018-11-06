entradas  = matrix(c(0,0,0,1,1,0,1,1), nrow=4, ncol=2, byrow = T)
entradas

#Operador e
saidas = matrix(c(0,0,0,1))

#Operador ou
saidas = matrix(c(0,1,1,1))

#Operador xor
saidas = matrix(c(0,1,1,0))
#rede não converge com uma camada

saidas
pesos = matrix(c(0.0,0.0))
pesos
taxadeAprendizagem = 0.1


stepFunction = function(soma) {
  if (soma >= 1) {
    return (1)
  }
  return (0)
}

calculaSaida = function(registro){
  soma = registro %*% pesos
  return (stepFunction(soma))
}

erroTotal = 1
while (erroTotal != 0){
  erroTotal = 0
  for(i in 1:length(saidas)){
    saidaCalculada = calculaSaida(c(entradas[i,]))
    erro = abs(saidas[i] - saidaCalculada)
    erroTotal = erroTotal + erro
    for( j in 1: length(pesos)){
      pesos[j] = pesos[j] +(taxadeAprendizagem*entradas[i,j]*erro)
      print(paste("Peso Atualizado:", pesos[j]))
    }
  }
  print(paste("Total de erros:", erroTotal))
}


