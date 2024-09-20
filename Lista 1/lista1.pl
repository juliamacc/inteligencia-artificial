% Sistema Especialista para diagnosticar doenças psiquiátricas
% Grupo: Julia, Sartori, Sofia 

/*
doenças: fobias específicas, fobia social, t. ansiedade generalizada(tag), toc, bipolar, t. explosivo interm., borderline, esquizofrenia, tdah, depressão maior, distimia

sintomas: ansiedade intensa, coração acelerado, tremores, dificuldade de concentração, irritabilidade e explosões de agressividade, mudanças de humor, pensamentos suicidas, perda de interesse e isolamento social, comportamentos repetitivos, suor excessivo, obsessões e compulsões, impulsividade, prejuízos sociais, paranoia, comportamento autodestrutivo, alterações de sono e apetite, baixa energia e apatia

tratamentos: psicoterapia cognitiva comportamental (TCC), terapia interpessoal, psicoeducação, reabilitação psicossocial, terapia de exposição, antipsicóticos, medicamentos estimulantes,  antidepressivos, estabilizadores de humor, medicamentos para controle de impulsividade, ansiolíticos
*/

% doenca(Doenca, Lista_de_Sintomas)
doenca(fobia_especifica, [coracao_acelerado, tremores, suor_excessivo]).
doenca(fobia_social, [ansiedade_intensa, coracao_acelerado, isolamento_social, suor_excessivo]).
doenca(tag, [ansiedade_intensa, coracao_acelerado, tremores, dificuldade_concentracao, suor_excessivo, sono_apetite]).
doenca(toc, [comportamentos_repetitivos, obsessoes_compulsoes, impulsividade, prejuizos_sociais]).
doenca(bipolar, [mudancas_humor, pensamentos_suicidas, impulsividade, sono_apetite, apatia]).
doenca(transt_explosivo, [irritabilidade, impulsividade]).
doenca(borderline, [irritabilidade, mudancas_humor, pensamentos_suicidas, impulsividade, prejuizos_sociais, autodestrutivo]).
doenca(esquizofrenia, [dificuldade_concentracao, mudancas_humor, paranoia, prejuizos_sociais, autodestrutivo]).
doenca(tdah, [dificuldade_concentracao, impulsividade, prejuizos_sociais, sono_apetite]).
doenca(depressao, [mudancas_humor, pensamentos_suicidas, isolamento_social, sono_apetite, apatia]).
doenca(distimia, [mudancas_humor, sono_apetite, apatia]).

% tratamento(Doenca, Lista_de_Tratamentos)
tratamento(fobia_especifica, [tcc, terapia_exposicao]).
tratamento(fobia_social, [tcc, terapia_exposicao, ansioliticos]).
tratamento(tag, [tcc, ansioliticos, antidepressivos]).
tratamento(toc, [tcc, antidepressivos]).
tratamento(bipolar, [tcc, estabilizadores_humor, antipsicoticos]).
tratamento(transt_explosivo, [tcc, medicamentos_impulsividade]).
tratamento(borderline, [terapia_interpessoal, antidepressivos, estabilizadores_humor, antipsicoticos]).
tratamento(esquizofrenia, [reabilitacao_psicosocial, antipsicoticos]).
tratamento(tdah, [tcc, psicoeducacao, medicamentos_estimulantes]).
tratamento(depressao, [tcc, terapia_interpessoal, antidepressivos]).
tratamento(distimia, [tcc, antidepressivos]).

% Verifica se uma doença corresponde a uma lista de sintomas
diagnostico(SintomasPessoa, Doenca, Tratamentos) :-
    doenca(Doenca, SintomasDoenca),
    subset(SintomasDoenca, SintomasPessoa), % Verifica se os sintomas da doença estão contidos nos sintomas da pessoa
    tratamento(Doenca, Tratamentos).

% Exemplo de como usar o diagnóstico
verificar_doenca(Sintomas) :-
    diagnostico(Sintomas, Doenca, Tratamentos),
    write('Diagnóstico: '), write(Doenca), nl,
    write('Tratamentos recomendados: '), write(Tratamentos), nl.

:- discontiguous verificar_doenca/1.

% Conta quantos elementos de uma lista estão em outra lista
conta_sintomas([], _, 0).
conta_sintomas([S|SintomasDoenca], SintomasPessoa, N) :-
    member(S, SintomasPessoa), % Verifica se o sintoma da doença está na lista de sintomas da pessoa
    conta_sintomas(SintomasDoenca, SintomasPessoa, N1),
    N is N1 + 1.
conta_sintomas([_|SintomasDoenca], SintomasPessoa, N) :-
    conta_sintomas(SintomasDoenca, SintomasPessoa, N). % Se o sintoma não está presente, apenas continue

% Verifica se uma doença corresponde a uma lista de sintomas (com pelo menos N sintomas coincidentes)
diagnostico(SintomasPessoa, Doenca, Tratamentos, MinimoSintomas) :-
    doenca(Doenca, SintomasDoenca),
    conta_sintomas(SintomasDoenca, SintomasPessoa, N),
    N >= MinimoSintomas,
    tratamento(Doenca, Tratamentos).

% Exemplo de como usar o diagnóstico
verificar_doenca(Sintomas) :-
    diagnostico(Sintomas, Doenca, Tratamentos, 3), % Define o número mínimo de sintomas para o diagnóstico
    write('Diagnóstico: '), write(Doenca), nl,
    write('Tratamentos recomendados: '), write(Tratamentos), nl.

% Teste de entrada:
% ?- verificar_doenca([tremores, suor_excessivo, coracao_acelerado]).