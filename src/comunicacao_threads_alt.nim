import std/malloc

#Comunicação por ponteiros crus:
var n = 42
var ponteiro = addr(n) #Pode passar o ponteiro entre threads, mas é necessário tomar cuidado com a sincronização

#Memória fora do garbage colector:
var dado = cast[ptr int](alloc(sizeof(int)))
dado [] = 123

