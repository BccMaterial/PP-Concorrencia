import std/threadpool

#Função executada na thread
proc worker(msg: string): string {.thread.} =
  return "Worker recebeu: " & msg

#Cria uma thread e retorna um FlowVar
let future = spawn worker("Olá mundo!")

#Bloqueia a thread principal até que o resultado esteja pronto
echo ^future #"^" espera que a FlowVar esteja pronta para retornar o valor ou passar uma excessão, caso a task falhe.