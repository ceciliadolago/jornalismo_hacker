
-- quantidade de doações registradas na base
sqlite> select count(*) from receitas;
347

-- partidos existentes na base de dados
sqlite> select distinct SiglaPartido from receitas; 
PPS
PDT
PP
PTB
PSDB
PSDC
PSB
PV
PT
PR
PSOL

-- maior doação realizada
sqlite> select max(ValorReceita), NomeDoador, SiglaPartido from receitas;
3000000.0|MINERAÇÕES BRASILEIRAS REUNIDAS S/A MBR|PSDB

-- menor doação realizada
sqlite> select min(ValorReceita), NomeDoador, SiglaPartido from receitas;
0.01||PT -- opa, essa de 1 centavo nem conta...
sqlite> select min(ValorReceita), NomeDoador, SiglaPartido from receitas where ValorReceita > 1;
20.0|MAURICIO BENEDINI BRUSADIN|PV

-- total de doações por partido
sqlite> select sum(ValorReceita) as soma, SiglaPartido from receitas group by SiglaPartido order by soma desc;
30606506.66|PSDB
13855550.26|PT
7536560.0|PSB
2255000.15|PPS
1622240.63|PR
770100.0|PP
552000.0|PTB
500000.0|PDT
350020.0|PV
25000.0|PSDC
8850.0|PSOL

-- doação média por partido
sqlite> select round(avg(ValorReceita),2) as soma, SiglaPartido from receitas group by SiglaPartido order by soma desc;
227140.17|PT
188414.0|PSB
183272.49|PSDB
166666.67|PDT
147476.42|PR
140937.51|PPS
110400.0|PTB
85566.67|PP
50002.86|PV
25000.0|PSDC
327.78|PSOL

-- quantidade de doações por partido
sqlite> select count(*) as count_doacoes, SiglaPartido from receitas group by SiglaPartido order by count_doacoes desc;
167|PSDB
61|PT
40|PSB
27|PSOL
16|PPS
11|PR
9|PP
7|PV
5|PTB
3|PDT
1|PSDC

-- doações para o PSOL
sqlite> select NomeDoador, ValorReceita from receitas where SiglaPartido = 'PSOL';
SEBASTIAO ALAIDE LOPES|300.0
AMERICA BENEDITA DE PAIVA RODRIGUES|300.0
ALEXANDRE BREVIGLIERI ALVES CASTILHO|300.0
MARIA JOSÉ DA SILVA BEZERRA|300.0
CREUSA LIMA DA SILVA|450.0
ALOE FERNANDES FELIPPE|900.0
VERSALHES REPRESENTAÇÕES COMERCIAIS S/C LTDA - ME|300.0
JULIA AZZI COLLET E SILVA|300.0
SANDRO APARECIDO NUNES|300.0
ANIZIO BATISTA DE OLIVEIRA|300.0
FLAVIA MUNHOZ DE CASTRO|300.0
DARIO DA SILVA MELO|300.0
OSMAR PEREIRA DE NEGREIROS|300.0
ALTAIR LOURENÇO DE LIMA|300.0
NEIDE REGES LIMA|300.0
ERIC NUNES DE SOUZA|300.0
LIVINO REINALDO REIS|300.0
ANTONIO BONFIM MOREIRA|300.0
RENATA DE OLIVEIRA SILVA|300.0
FABIO ANTONIO FERREIRA DA SILVA|300.0
LUIZ CARLOS DE SOUZA|300.0
AKIKO AKIYAMA|300.0
AGOSTINHO FERREIRA GOMES|300.0
LUIZ PEDRO BOM|300.0
JANDUHY CORDEIRO DE ALENCAR|300.0
MARIA DE LOURDES DE SOUZA|300.0
LUIZ PEDRO BOM|300.0
-- que tal examinar as doações para um partido de sua escolha? ^^

-- doações para o PSDC (único partido com apenas uma doação)
sqlite> select NomeDoador, ValorReceita from receitas where SiglaPartido = 'PSDC';
SAFRA LEASING SA ARRENDAMENTO MERCANTIL|25000.0

-- examiando campo DescricaoReceita
sqlite> select distinct SiglaPartido, DescricaoReceita from receitas where DescricaoReceita <> '';
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9869 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9892 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 22.163 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9894 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9895 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.559 TONELADAS DE PAPEL EXTRA ALVURA BRA 90G 66X96 FL.250 C42, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 9902 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REF. A 10.134 TON. DE PAPEL RENOVA SOFT NAT, SENDO R$ 3.161.510 A TON., COM CUSTO AVALIADO 'PARCIAL' CONFORME N. F. 11008 DO PRÓPRIO DOADOR.OBS: SALDO DE 168 KG NO VALOR R$ 557.69 PERMANECEU NO PARTIDO NÃO UTILIZADO P/ FINS ELEITORAIS.
PR|DOAÇÃO ESTIMÁVEL REF. A 13.286.80 TON. DE PAPEL RENOVA SOFT NAT, SENDO R$ 3.161.510 A TON., COM CUSTO AVALIADO 'PARCIAL' CONF. N. F. 11004 DO DOADOR.OBS. SALDO DE 10.365.20 TON VALOR DE R$ 34.410.56 PERMANECEU NO PARTIDO NÃO UTILIZADO P/ FINS ELEITORAIS.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 22.618 TONELADAS DE PAPEL EXTRA ALVURA BRA 180G, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 11010 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 9.151 TONELADAS DE PAPEL EXTRA ALVURA BRA, SENDO R$ 2.927.84 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 11009 DO PRÓPRIO DOADOR.
PR|DOAÇÃO ESTIMÁVEL REFERENTE A 24.948 TONELADAS DE PAPEL EXTRA ALVURA BRA 75G 66X96 FL.500 C25, SENDO R$ 2.927.840 A TONELADA, COM CUSTO AVALIADO CONFORME NOTA FISCAL 12035 DO PRÓPRIO DOADOR.

-- receita só é descrita para o PR
-- parece que o PR gosta de papel!
-- vamos examinar mais essas receitas de papel...
sqlite> select SiglaPartido, ValorReceita, NomeDoador from receitas where DescricaoReceita <> '';
PR|75500.06|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|68134.21|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|75500.06|M D PAPÉIS LTDA.
PR|33640.67|M D PAPÉIS LTDA.
PR|44104.28|M D PAPÉIS LTDA.
PR|69532.99|M D PAPÉIS LTDA.
PR|28132.3|M D PAPÉIS LTDA.
PR|76695.94|M D PAPÉIS LTDA.
-- hummm... pelo menos foram doadas por uma empresa de papel...

-- descobrindo tipos de receitas existentes
sqlite> select distinct TipoReceita from receitas;
Recursos de pessoas jurídicas
Recursos de pessoas físicas
RECURSOS DE PARTIDO POLÍTICO
RECURSOS DE OUTROS CANDIDATOS/COMITÊS
Recursos de origens não identificadas

-- valor de doações de pessoas jurídicas por partido
sqlite> select SiglaPartido, sum(ValorReceita) as soma from receitas where TipoReceita like '%jurídicas%' group by SiglaPartido order by soma desc;
PSDB|28751506.66
PT|12254300.25
PSB|4430000.0
PPS|2090000.0
PP|770000.0
PR|622240.63
PTB|550000.0
PDT|500000.0
PV|350000.0
PSDC|25000.0
PSOL|300.0

-- quantidade de doações de pessoas jurídicas por partido
sqlite> select count(*) as count_receitas, SiglaPartido from receitas where TipoReceita like '%jurídicas%' group by SiglaPartido order by count_receitas desc;
159|PSDB
55|PT
23|PSB
14|PPS
10|PR
8|PP
6|PV
3|PDT
3|PTB
1|PSDC
1|PSOL

-- maior doação feita por pessoa física
sqlite> select max(ValorReceita), NomeDoador, SiglaPartido from receitas where TipoReceita like '%físicas%';
100000.0|WALTER JORGE PAULO FILHO|PSDB
-- que tal googlar o nome desse cara ;)

-- quantidade de doações de pessoas físicas por partido
sqlite> select count(*) as count_receitas, SiglaPartido from receitas where TipoReceita like '%físicas%' group by SiglaPartido order by count_receitas desc;
26|PSOL
6|PSDB
2|PTB
1|PP
1|PPS
1|PV




