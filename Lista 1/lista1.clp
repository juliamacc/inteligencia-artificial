(deftemplate person
   (slot name)
   (slot ansiedade_intensa (default nil))
   (slot coração_acelerado (default nil))
   (slot tremores (default nil))
   (slot dificuldade_de_concentração (default nil))
   (slot irritabilidade_e_explosões_de_agressividade (default nil))
   (slot mudanças_de_humor (default nil))
   (slot pensamentos_suicidas (default nil))
   (slot perda_de_interesse_e_isolamento_social (default nil))
   (slot comportamentos_repetitivos (default nil))
   (slot suor_excessivo (default nil))
   (slot obsessões_e_compulsões (default nil))
   (slot impulsividade (default nil))
   (slot prejuízos_sociais (default nil))
   (slot paranoia (default nil))
   (slot comportamento_autodestrutivo (default nil))
   (slot alterações_de_sono_e_apetite (default nil))
   (slot baixa_energia_e_apatia (default nil))
   (slot prejuizos_sociais (default nil))
)

(defrule get_alterações_de_sono_e_apetite
   ?p <- (person (name ?name) (alterações_de_sono_e_apetite nil))
   =>
   (printout t "Você sente alterações_de_sono_e_apetite? (yes/no) ")
   (bind ?s (read))
   (modify ?p (alterações_de_sono_e_apetite ?s)))

(defrule get_ansiedade_intensa
   ?p <- (person (name ?name) (ansiedade_intensa nil))
   =>
   (printout t "Você sente ansiedade_intensa? (yes/no) ")
   (bind ?s (read))
   (modify ?p (ansiedade_intensa ?s)))

(defrule get_baixa_energia_e_apatia
   ?p <- (person (name ?name) (baixa_energia_e_apatia nil))
   =>
   (printout t "Você sente baixa_energia_e_apatia? (yes/no) ")
   (bind ?s (read))
   (modify ?p (baixa_energia_e_apatia ?s)))

(defrule get_comportamento_autodestrutivo
   ?p <- (person (name ?name) (comportamento_autodestrutivo nil))
   =>
   (printout t "Você sente comportamento_autodestrutivo? (yes/no) ")
   (bind ?s (read))
   (modify ?p (comportamento_autodestrutivo ?s)))

(defrule get_comportamentos_repetitivos
   ?p <- (person (name ?name) (comportamentos_repetitivos nil))
   =>
   (printout t "Você sente comportamentos_repetitivos? (yes/no) ")
   (bind ?s (read))
   (modify ?p (comportamentos_repetitivos ?s)))

(defrule get_coração_acelerado
   ?p <- (person (name ?name) (coração_acelerado nil))
   =>
   (printout t "Você sente coração_acelerado? (yes/no) ")
   (bind ?s (read))
   (modify ?p (coração_acelerado ?s)))

(defrule get_dificuldade_de_concentração
   ?p <- (person (name ?name) (dificuldade_de_concentração nil))
   =>
   (printout t "Você sente dificuldade_de_concentração? (yes/no) ")
   (bind ?s (read))
   (modify ?p (dificuldade_de_concentração ?s)))

(defrule get_impulsividade
   ?p <- (person (name ?name) (impulsividade nil))
   =>
   (printout t "Você sente impulsividade? (yes/no) ")
   (bind ?s (read))
   (modify ?p (impulsividade ?s)))

(defrule get_irritabilidade_e_explosões_de_agressividade
   ?p <- (person (name ?name) (irritabilidade_e_explosões_de_agressividade nil))
   =>
   (printout t "Você sente irritabilidade_e_explosões_de_agressividade? (yes/no) ")
   (bind ?s (read))
   (modify ?p (irritabilidade_e_explosões_de_agressividade ?s)))

(defrule get_mudanças_de_humor
   ?p <- (person (name ?name) (mudanças_de_humor nil))
   =>
   (printout t "Você sente mudanças_de_humor? (yes/no) ")
   (bind ?s (read))
   (modify ?p (mudanças_de_humor ?s)))

(defrule get_obsessões_e_compulsões
   ?p <- (person (name ?name) (obsessões_e_compulsões nil))
   =>
   (printout t "Você sente obsessões_e_compulsões? (yes/no) ")
   (bind ?s (read))
   (modify ?p (obsessões_e_compulsões ?s)))

(defrule get_paranoia
   ?p <- (person (name ?name) (paranoia nil))
   =>
   (printout t "Você sente paranoia? (yes/no) ")
   (bind ?s (read))
   (modify ?p (paranoia ?s)))

(defrule get_pensamentos_suicidas
   ?p <- (person (name ?name) (pensamentos_suicidas nil))
   =>
   (printout t "Você sente pensamentos_suicidas? (yes/no) ")
   (bind ?s (read))
   (modify ?p (pensamentos_suicidas ?s)))

(defrule get_perda_de_interesse_e_isolamento_social
   ?p <- (person (name ?name) (perda_de_interesse_e_isolamento_social nil))
   =>
   (printout t "Você sente perda_de_interesse_e_isolamento_social? (yes/no) ")
   (bind ?s (read))
   (modify ?p (perda_de_interesse_e_isolamento_social ?s)))

(defrule get_prejuizos_sociais
   ?p <- (person (name ?name) (prejuizos_sociais nil))
   =>
   (printout t "Você sente prejuizos_sociais? (yes/no) ")
   (bind ?s (read))
   (modify ?p (prejuizos_sociais ?s)))

(defrule get_suor_excessivo
   ?p <- (person (name ?name) (suor_excessivo nil))
   =>
   (printout t "Você sente suor_excessivo? (yes/no) ")
   (bind ?s (read))
   (modify ?p (suor_excessivo ?s)))

(defrule get_tremores
   ?p <- (person (name ?name) (tremores nil))
   =>
   (printout t "Você sente tremores? (yes/no) ")
   (bind ?s (read))
   (modify ?p (tremores ?s)))

(assert (person (name john)))
(run)
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes
yes

(defrule check_bipolar
   ?p <- (person (name ?name) (mudanças_de_humor yes) (pensamentos_suicidas yes) (impulsividade yes) (alterações_de_sono_e_apetite yes) (baixa_energia_e_apatia yes))
   =>
   (assert (bipolar ?name)))

(defrule found_bipolar
   ?p <- (bipolar ?name)
   =>
   (printout t ?name " pode ter bipolar" crlf)
   (printout t "Os tratamentos recomendados são tcc, estabilizadores_humor, antipsicoticos" crlf))

(defrule check_borderline
   ?p <- (person (name ?name) (irritabilidade_e_explosões_de_agressividade yes) (mudanças_de_humor yes) (pensamentos_suicidas yes) (impulsividade yes) (prejuizos_sociais yes) (comportamento_autodestrutivo yes))
   =>
   (assert (borderline ?name)))

(defrule found_borderline
   ?p <- (borderline ?name)
   =>
   (printout t ?name " pode ter borderline" crlf)
   (printout t "Os tratamentos recomendados são terapia_interpessoal, antidepressivos, estabilizadores_humor, antipsicoticos" crlf))

(defrule check_depressão
   ?p <- (person (name ?name) (mudanças_de_humor yes) (pensamentos_suicidas yes) (perda_de_interesse_e_isolamento_social yes) (alterações_de_sono_e_apetite yes) (baixa_energia_e_apatia yes))
   =>
   (assert (depressão ?name)))

(defrule found_depressão
   ?p <- (depressão ?name)
   =>
   (printout t ?name " pode ter depressão" crlf)
   (printout t "Os tratamentos recomendados são tcc, terapia_interpessoal, antidepressivos" crlf))

(defrule check_distimia
   ?p <- (person (name ?name) (mudanças_de_humor yes) (alterações_de_sono_e_apetite yes) (baixa_energia_e_apatia yes))
   =>
   (assert (distimia ?name)))

(defrule found_distimia
   ?p <- (distimia ?name)
   =>
   (printout t ?name " pode ter distimia" crlf)
   (printout t "Os tratamentos recomendados são tcc, antidepressivos" crlf))

(defrule check_esquizofrenia
   ?p <- (person (name ?name) (dificuldade_de_concentração yes) (mudanças_de_humor yes) (paranoia yes) (prejuizos_sociais yes) (comportamento_autodestrutivo yes))
   =>
   (assert (esquizofrenia ?name)))

(defrule found_esquizofrenia
   ?p <- (esquizofrenia ?name)
   =>
   (printout t ?name " pode ter esquizofrenia" crlf)
   (printout t "Os tratamentos recomendados são reabilitacao_psicosocial, antipsicoticos" crlf))

(defrule check_fobia_social
   ?p <- (person (name ?name) (ansiedade_intensa yes) (coração_acelerado yes) (perda_de_interesse_e_isolamento_social yes) (suor_excessivo yes))
   =>
   (assert (fobia_social ?name)))

(defrule found_fobia_social
   ?p <- (fobia_social ?name)
   =>
   (printout t ?name " pode ter fobia social" crlf)
   (printout t "Os tratamentos recomendados são tcc, terapia_exposicao, ansioliticos" crlf))

(defrule check_fobias_específicas
   ?p <- (person (name ?name) (coração_acelerado yes) (tremores yes) (suor_excessivo yes))
   =>
   (assert (fobias_específicas ?name)))

(defrule found_fobias_específicas
   ?p <- (fobias_específicas ?name)
   =>
   (printout t ?name " pode ter fobias específicas" crlf)
   (printout t "Os tratamentos recomendados são tcc, terapia_exposição" crlf))

(defrule check_tag
   ?p <- (person (name ?name) (ansiedade_intensa yes) (coração_acelerado yes) (tremores yes) (dificuldade_de_concentração yes) (suor_excessivo yes) (alterações_de_sono_e_apetite yes))
   =>
   (assert (tag ?name)))

(defrule found_tag
   ?p <- (tag ?name)
   =>
   (printout t ?name " pode ter tag" crlf)
   (printout t "Os tratamentos recomendados são tcc, ansioliticos, antidepressivos" crlf))

(defrule check_tdah
   ?p <- (person (name ?name) (dificuldade_de_concentração yes) (impulsividade yes) (prejuizos_sociais yes) (alterações_de_sono_e_apetite yes))
   =>
   (assert (tdah ?name)))

(defrule found_tdah
   ?p <- (tdah ?name)
   =>
   (printout t ?name " pode ter tdah" crlf)
   (printout t "Os tratamentos recomendados são tcc, psicoeducacao, medicamentos_estimulantes" crlf))

(defrule check_toc
   ?p <- (person (name ?name) (comportamentos_repetitivos yes) (obsessões_e_compulsões yes) (impulsividade yes) (prejuizos_sociais yes))
   =>
   (assert (toc ?name)))

(defrule found_toc
   ?p <- (toc ?name)
   =>
   (printout t ?name " pode ter toc" crlf)
   (printout t "Os tratamentos recomendados são tcc, antidepressivos" crlf))

(defrule check_transtorno_explosivo
   ?p <- (person (name ?name) (irritabilidade_e_explosões_de_agressividade yes) (impulsividade yes))
   =>
   (assert (transtorno_explosivo ?name)))

(defrule found_transtorno_explosivo
   ?p <- (transtorno_explosivo ?name)
   =>
   (printout t ?name " pode ter transtorno explosivo" crlf)
   (printout t "Os tratamentos recomendados são tcc, medicamentos_impulsividade" crlf))
