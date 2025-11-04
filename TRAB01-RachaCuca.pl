resolve(S) :-
    S = happyhour(_,_,_,_,_),
    
    %Em uma das pontas está o homem que gosta de Sinuca.
    uma_das_pontas(A,S),
    esporte(A,sinuca),
    %Reginaldo é o mais novo.
    nome(C,reginaldo),
    idade(C,25),
    %Hugo está ao lado de quem está bebendo a cerveja Inglesa.
    nome(D,hugo),
    ao_lado(D,E,S),
    cerveja(E,inglesa),
    %Kleber está em algum lugar entre o homem da gravata Azul
    % e quem trabalha na Administração, nessa ordem.
    algum_lugar_entre(F,H,G,S),
    nome(F,kleber),
    gravata(G,azul),
    setor(H,administracao),
    %O homem da gravata Azul está ao lado de quem está bebendo a cerveja Inglesa.
    ao_lado(I,J,S),
    gravata(I,azul),
    cerveja(J,inglesa),
    %Quem gosta de Futebol está exatamente à direita de quem trabalha na Administração.
    exatamente_a_direita(K,L,S),
    esporte(K,futebol),
    setor(L,administracao),
    %O amigo que trabalha na Contabilidade está ao lado do que gosta de Corrida.
    %ao_lado(M,N,S),
    %setor(M,contabilidade),
    %esporte(N,corrida),
    %O homem da gravata Verde está em algum lugar à esquerda de 
    %quem trabalha no setor Comercial.
    algum_lugar_a_esquerda(O,P,S),
    gravata(O,verde),
    setor(P,comercial),
    %Em uma das pontas está o homem que trabalha no RH
    uma_das_pontas(B,S),
    setor(B,rh),
    %Quem gosta de Natação está exatamente à direita de quem esta bebendo a cerveja Belga.
    exatamente_a_direita(Q,R,S),
    esporte(Q,natacao),
    cerveja(R,belga),
    %O homem que trabalha na Administração está ao lado de quem 
    %está bebendo a cerveja Irlandesa.
    ao_lado(T,U,S),
    setor(T,administracao),
    cerveja(U,irlandesa),
    %O amigo mais velho está bebendo a cerveja Brasileira.
    idade(V,37),
    cerveja(V,brasileira),
    %O homem da gravata Branca está exatamente à direita de quem trabalha na Administração.
    exatamente_a_direita(W,X,S),
    gravata(W,branca),
    setor(X,administracao),
    %O homem da gravata Vermelha trabalha no setor Comercial.
    gravata(Y,vermelha),
    setor(Y,comercial),
    %O amigo que está bebendo a cerveja Alemã está exatamente à esquerda de quem tem 28 anos.
    exatamente_a_esquerda(Z,A1,S),
    cerveja(Z,alema),
    idade(A1,28),
    %Na primeira posição está quem trabalha no setor de Vendas.
    primeira_posicao(A2,S),
    setor(A2,vendas),
    %O homem da gravata Vermelha está em algum lugar à esquerda de quem está bebendo a cerveja Alemã.
    algum_lugar_a_esquerda(A3,A4,S),
    gravata(A3,vermelha),
    cerveja(A4,alema),
    %Quem tem 34 anos está ao lado de quem gosta de Corrida.
    ao_lado(A5,A6,S),
    idade(A5,34),
    esporte(A6,corrida),
    %Tiago está na segunda posição.
    segunda_posicao(A7,S),
    nome(A7,tiago),
    %O amigo de 30 anos está bebendo a cerveja Inglesa.
    idade(A8,30),
    cerveja(A8,inglesa),
    %O homem da gravata Verde está ao lado de Tiago.
    ao_lado(A9,B1,S),
    gravata(A9,verde),
    nome(B1,tiago),
    %Quem gosta de Basquete está exatamente à esquerda de quem tem 28 anos.
    exatamente_a_esquerda(B2,B3,S),
    esporte(B2,basquete),
    idade(B3,28),
    %fechamento
    gravata(_,amarela),
    nome(_,david).
    
gravata(amigo(G,_,_,_,_,_),G).
nome(amigo(_,N,_,_,_,_),N).
cerveja(amigo(_,_,C,_,_,_),C).
idade(amigo(_,_,_,I,_,_),I).
setor(amigo(_,_,_,_,S1,_),S1).
esporte(amigo(_,_,_,_,_,E),E).

uma_das_pontas(X,happyhour(X,_,_,_,_)).
uma_das_pontas(X,happyhour(_,_,_,_,X)).

exatamente_a_direita(X,Y,happyhour(Y,X,_,_,_)).
exatamente_a_direita(X,Y,happyhour(_,Y,X,_,_)).
exatamente_a_direita(X,Y,happyhour(_,_,Y,X,_)).
exatamente_a_direita(X,Y,happyhour(_,_,_,Y,X)).

exatamente_a_esquerda(X,Y,S) :-
    exatamente_a_direita(Y,X,S).

ao_lado(X,Y,S) :-
    exatamente_a_esquerda(X,Y,S);
    exatamente_a_esquerda(Y,X,S).

algum_lugar_a_esquerda(X,Y,happyhour(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,happyhour(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,happyhour(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,happyhour(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,happyhour(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,happyhour(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,happyhour(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,happyhour(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,happyhour(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y,happyhour(_,_,_,X,Y)).

algum_lugar_entre(M,I,F,happyhour(I,M,F,_,_)).
algum_lugar_entre(M,I,F,happyhour(I,M,_,F,_)).
algum_lugar_entre(M,I,F,happyhour(I,M,_,_,F)).
algum_lugar_entre(M,I,F,happyhour(I,_,M,F,_)).
algum_lugar_entre(M,I,F,happyhour(I,_,M,_,F)).
algum_lugar_entre(M,I,F,happyhour(I,_,_,M,F)).
algum_lugar_entre(M,I,F,happyhour(_,I,M,F,_)).
algum_lugar_entre(M,I,F,happyhour(_,I,M,_,F)).
algum_lugar_entre(M,I,F,happyhour(_,I,_,M,F)).
algum_lugar_entre(M,I,F,happyhour(_,_,I,M,F)).

primeira_posicao(X,happyhour(X,_,_,_,_)).
segunda_posicao(X,happyhour(_,X,_,_,_)).

    