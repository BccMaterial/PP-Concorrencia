import std/locks, std/threadpool

#Sincronização por Locks

var cont = 0 #Compartilhado entre threads
var mutex = Lock #Protege o acesso ao contador
initLock(mutex) #inicialização do mutex

proc task(n:int) {.thread.} =
  for i in 1..1000:
    acquire(mutex) #Bloqueia o mutex, gerando acesso exclusivo a thread atual para a seção crítica
    cont += 1
    release(mutex) #Faz a liberação da mutex, permitindo que outra thr