-module(search).

-export([binary/2]).



binary(Lista,Numero) when length(Lista) > 0 ->
    
    Cantidad = length(Lista),

    %% Revisar si la cantidad de elementos es mayor a uno
    %% en el caso de ser uno y realizar la operacion 
    %% al ser el resutado de la operacion 1/2 = 0.5 nos truncara
    %% a 0 y como las listas de erlang los elementos empiezan desde 
    %% el numero 1 nos dará error
    if 
        Cantidad > 1 ->
            PosicionActual = trunc(Cantidad/2);
        true -> 
            PosicionActual = Cantidad
    end,

    ValorActual = lists:nth(PosicionActual,Lista),

    if 
        
        ValorActual == Numero ->
            io:format("Encontrado!!!");
        %% Si el numero encontrado es menor al que queremos
        %% entonces acortamos hacia la derecha nuestra lista
        %% sublist(List, start, len)
        ValorActual > Numero ->
            ListaCorta = lists:sublist(Lista, 1 , PosicionActual - 1),
            binary(ListaCorta,Numero);
        ValorActual < Numero -> 
            ListaCorta = lists:sublist(Lista, PosicionActual + 1 , Cantidad),
            binary(ListaCorta,Numero);
        true  -> io:format("Error")
    end.