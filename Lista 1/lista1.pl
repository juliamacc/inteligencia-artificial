%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sistema Especialista para diagnosticar doenças psiquiátricas %%
%%           Grupo: Julia, Sartori, Sofia                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% Verifica se o paciente tem a maioria dos sintomas da doença
diagnostico(Paciente, Doenca) :-
    findall(Sintoma, sintoma(Paciente, Sintoma), SintomasPaciente), % sintomas do paciente
    doenca(Doenca, SintomasDoenca),                            % sintomas de doença específica
    intersecao(SintomasPaciente, SintomasDoenca, SintomasEmComum),
    length(SintomasEmComum, N),               % conta quantos sintomas tem em comum
    N >= 3.                                   % ajusta diagnostico para 3 ou mais sintomas                      


% tratamento_recomendado(X, Tratamento) recomenda o tratamento baseado no diagnóstico da doença
tratamento_recomendado(Paciente, Tratamento) :-
    diagnostico(Paciente, Doenca),
    tratamento(Doenca, Tratamento).


% Teste de paciente
% sintoma(X, Sintoma) sintomas do paciente X
sintoma(mario, coracao_acelerado).
sintoma(mario, suor_excessivo).
sintoma(mario, tremores).

% Teste no terminal
% ?- tratamento_recomendado(mario, Tratamento).