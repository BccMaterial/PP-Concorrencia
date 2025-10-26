import std/[threadpool, sequtils, sugar] #Precisamos da threadpool da função spawn

proc tarefaPesada(n: int): int {.thread.} = #"{.thread.} indica que a tarefaPesada é escrita para rodar em worker threads
  var acc = 0

  for i in 1..(n * 1000) : acc += i
  
  result = acc

#O retorno de spawn será um "FlowVar[T]", um objeto que inicialmente tem estado pendente até a task(thread) ser concluída
let futures = collect(newSeq):
  for i in 1..4: 
    spawn tarefaPesada(i)
  
for future in futures:
  echo "Resultado: ", ^future #"^" espera que a FlowVar esteja pronta para retornar o valor ou passar uma excessão, caso a task falhe.