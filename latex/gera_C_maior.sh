#!/bin/bash
###########################
# Unfinished/Não Finalizado
# Script para criação de escalas (com intervalos)
# v 0.1
# Autor: Jacson Querubin (spacial@gmail.com)
# Licença: GPL v3 ou superior
# Data: 25/04/2016
# Entrada(s): 
#		[1] - Nome do arquivo .tex (depois .pdf - default:C_Maior.tex) : opcional
#		[2] - Escala inicial (default: Dó Maior - C)  : opcional
# Saída(s): Arquivo tex e pdf com a escala
###########################
ARQ=C_Maior.tex
INICIO=c
FIM=b

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
\\title{Escala em D{\\'{o}} Maior (\\textbf{C Maj})}
\\author{Jacson Querubin}
\\date{\\today}
\\marginsize{2cm}{2cm}{1cm}{1cm}

\\begin{document}
\\maketitle
" > ${ARQ}


 PIANO=(Co Do Eo Fo Go Ao Bo Ct)
ESCALA=(c  d  e  f  g  h  i  j )
INTERVALO=(Uníssona/Primeira Segunda Terça Quarta Quinta Sexta Sétima Oitava) 
CRES=1
for (( i = 0 ; i < ${#ESCALA[@]} ; i++ )) do
	echo "Gerando ${INTERVALO[$i]}"
	pnp=${PIANO[0]}
	pne=${ESCALA[0]}
	snp=${PIANO[${i}]}
	sne=${ESCALA[${i}]}
	pi1=$(piano ${PIANO[0]} ${PIANO[${i}]})
	pa1=$(pauta ${ESCALA[0]} ${ESCALA[${i}]})
	echo "
		\\begin{figure}[thpb]\\
		\\centering
	    	${pi1}
		${pa1}
    		\\caption{ \\textbf{${pnp:0:1}} e \\textbf{${snp:0:1}} - ${INTERVALO[$i]}}
		\\end{figure} " >> ${ARQ}
done


echo '
\end{document}' >> ${ARQ}

