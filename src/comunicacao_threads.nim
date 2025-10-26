import std/threads, std/os

#Diferente de C ou C#, cada thread em Nim tem seu próprio heap que é gerenciado por um garbage colector independente
#Objetos alocados como seq ou string pertencem apenas a thread responsável por sua criação

#Comunicação por threads:
var canal: Channel[string] #Channel[T] é uma fila que permite a comuniacação entre threads de maneira segura
canal.open() #Faz a inicialização do canal para permitir o uso de send ou recv
 
proc worker() {.thread.} =
  let msg = canal.recv() #Faz o bloqueamento da thread até que ocorra o envio de uma mensagem para o canal com canal.send
  echo "Recebeu: ", msg #OBS: caso a mensagem não chegue, a thread é bloqueada indefinidamente

var t: Thread[void] #Armazena o identificador da thread, onde a mesma não retorna nada. Serve apenas para fazer jointhread
createThread(t, worker) #Cria uma nova thread que entra em worker() e fica bloqueada em recv() enquanto espera a mensagem

ch.send("Olá mundo!") #Cópia segura da string
joinThread(t) 