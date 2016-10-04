#!/bin/bash
###########################
# Unfinished/Não Finalizado
# Script para criação das escalas do exercício em latex
# v 0.1
# Autor: Jacson Querubin (spacial@gmail.com)
# Licença: GPL v3 ou superior
# Data: 25/04/2016
# Entrada(s): 
# Saída(s): Arquivo tex com a escala
###########################
ARQ=Exercicio$(date +%Y%m%d).tex

lc(){
    case "$1" in
        [A-Z])
        n=$(printf "%d" "'$1")
        n=$((n+32))
        printf \\$(printf "%o" "$n")
    esac
}

function pauta()
{
    local  __resultvar1=$1
    local  __resultvar2=$2
    local  myresult="\\input musixtex
                \\begin{music}\\nostartrule
                        \\parindent12mm
                        \\instrumentnumber{1} % a single instrument
                        \\setstaffs1{1}
                        \\startextract % starting real score
                        \\Notes\\qb0{${__resultvar1}${__resultvar2}}\\en
                        \\zendextract % terminate excerpt
                \\end{music}"
    echo "$myresult"
}

function piano(){
    local  __resultvar1=$1
    local  __resultvar2=$2
    local  myresult="\\keyboard[${__resultvar1}][${__resultvar2}]"

    echo "$myresult"
}

echo "\\documentclass[a4paper,12pt]{article}
\\usepackage[portuges]{babel}
\\usepackage[utf8]{inputenc}
\\usepackage[labelformat=empty]{caption}
\\usepackage{abc}
\\usepackage{musixtex}
\\usepackage{piano}
\\usepackage{anysize}
\\title{Classificação dos Intervalos}
\\author{Jacson Querubin}
\\date{\\today}
\\marginsize{2cm}{2cm}{1cm}{1cm}

\\begin{document}
\\maketitle
" > ${ARQ}


 PIANO1=(Eo Eo Bo Fo Ct Go Eo Ao Eo Ao Bo Go Fo Do )
ESCALA1=(e  e  i  f  j  g  e  h  e  h  i  g  f  d)
 PIANO2=(Fo Go Ft Bo Et Ao Et Ct Ao Bo Ct Et Et Fo)
ESCALA2=(f  g  m  i  l  h  l  j  h  i  j  l  l  f)
INTERVALO=(Uníssona/Primeira Segunda Terça Quarta Quinta Sexta Sétima Oitava)
CLASS=(2 3 5 4 3 2 8 3 4 2 2 6 7 3)  
CRES=1
FIM=''
for (( i = 0 ; i < ${#ESCALA1[@]} ; i++ )) do
	pnp=${PIANO1[${i}]}
	pne=${ESCALA1[${i}]}
	snp=${PIANO2[${i}]}
	sne=${ESCALA2[${i}]}
	np=$(piano ${pnp} ${snp})
	ne=$(pauta ${pne} ${sne})
# \Notes \zsong{Segunda} \qa{gh} \en \bar
# 	echo " \\Notes \\qb0{${pne}${sne}} \\en \\bar"
	FIM=${FIM}' 
  \Notes \zsong{'${INTERVALO[${CLASS[${i}]}-1]}'} \qa{'${pne}${sne}'} \en \bar'
	echo "
		\\begin{figure}[thpb]\\
		\\centering
	    	${np}
		${ne}
    		\\caption{ \\textbf{${pnp:0:1}} e \\textbf{${snp:0:1}} :${INTERVALO[${CLASS[${i}]}-1]} }
		\\end{figure} " >> ${ARQ}
#                \\caption{ \\textbf{${pnp:0:1}} e \\textbf{${snp:0:1}} - ${INTERVALO[$i]}}
done

FINAL="	\\begin{figure}[thpb]\
		\\begin{music}\\nostartrule
			\\nobarnumbers
			\\parindent12mm
			\\instrumentnumber{1} % a single instrument
			\\setstaffs1{1}
			\\startextract % starting real score"

echo ${FINAL} ${FIM} >> ${ARQ}
echo '		\caption{ \textbf{D} e \textbf{F} :Terça }
		\end{figure} ' >> ${ARQ}


echo '
\end{document}' >> ${ARQ}

