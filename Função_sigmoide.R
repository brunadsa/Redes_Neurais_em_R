#Função Sigmoide
sigmoide = function(soma){
  return(1 / (1 + exp(-soma)))
}

a = sigmoide(0)
a
a = sigmoide(50)
a