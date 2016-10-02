#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
Frequency and Notes: Forever!
"""

__author__ = "Jacson Querubin"
__copyright__ = "Copyright 2016 - Jacson Querubin"
__credits__ = ["Jacson Querubin"]
__license__ = "GPLv3 ou superior"
__version__ = "0.1.1"
__maintainer__ = "Jacson Querubin"
__email__ = "spacial@gmail.com"
__status__ = "Alpha"
__prog__ = "fnf"

import argparse
import sys
import math

# C0
notabase = 16.352

# Para criar Tabela de Notas x Freqs.
cromatica = ['C',
    'D:b/C:#', 'D',
    'E:b/D:#', 'E',
    'F', 'G:b/F:#', 'G',
    'A:b/G:#', 'A',
    'B:b/A:#', 'B']


intervalos = ['Uníssona',
    '2a menor', '2a Maior',
    '3a menor', '3a Maior',
    '4a Justa', 'Trítona', '5a Justa',
    '6a menor', '6a Maior',
    '7a menor', '7a Maior',
    'Oitava']


def nomeescala(oitava):
    global cromatica
    retorna = []
    for i in range(0, len(cromatica)):
        if len(cromatica[i]) == 1:
            nota = cromatica[i] + str(oitava)
            retorna.append(nota)
        else:
            notab = cromatica[i].split('/')[0].split(':')[0] + str(oitava) + \
                    cromatica[i].split('/')[0].split(':')[1]
            notasus = cromatica[i].split('/')[1].split(':')[0] + str(oitava) + \
                      cromatica[i].split('/')[1].split(':')[1]
            retorna.append(notab + '/' + notasus)
    return retorna


def freqescala(oitava):
    global notabase
    retorna = []
    basefreq = notabase * calsalto(oitava * 12)
    for i in range(0, 12):
        retorna.append("{0:.4f}".format(basefreq))
        basefreq *= calsalto(1)
    return retorna


# recebe a nota, envia a frequencia
def ntof(nota):
    global notabase
    oitava = int(''.join(ele for ele in nota if ele.isdigit()))
    notas = nomeescala(oitava)
    for i in range(0, len(notas)):
        if notas[i].find(nota) >= 0:
            if nota.find('b') >= 0:
                return notabase * calsalto((oitava * 12) + i)
            else:
                return notabase * calsalto((oitava * 12) + (i + 1))
    return -1


#notas e frequencias da oitava (para mostrar na tela)
def nfo(oitava):
    global notabase
    retorna = []
    escala = nomeescala(oitava)
    basefreq = notabase * calsalto(oitava * 12)
    for i in range(0, len(escala)):
        retorna.append(escala[i], " = {0:.4f}".format(basefreq))
        basefreq *= calsalto(1)
    return retorna


def calsalto(semitons):
    coef = 2.0 ** (1 / 12)
    #print(coef)
    return float(coef ** semitons)


def triadeM(basenote):
    terca = math.trunc(basenote * calsalto(4))
    quinta = math.trunc(basenote * calsalto(7))
    return [basenote, terca, quinta]


def triademenor(basenote):
    terca = math.trunc(basenote * calsalto(3))
    quinta = math.trunc(basenote * calsalto(7))
    return [basenote, terca, quinta]


def main():
    global intervalos
    parser = argparse.ArgumentParser(description=__prog__ + ' v' + __version__)
    parser.add_argument('-v', '--version', action='version', version='%(prog)s'
        + ' v' + str(__version__))
    parser.add_argument('-n', '--note', nargs='?', dest='note', default='A4',
        help='Nota base (formato X0A (nota, oitava e acidente). Padrão: A4')
    parser.add_argument('-f', '--frequency', nargs='?', dest='freq', type=int,
        default=440, help='Frequência base (padrão: 440 Hz).')
    parser.add_argument('-s', '--scale', nargs='?', dest='scale', type=int,
        default=0, help='Gera escala até o Hz indicado')
    parser.add_argument('-w', '--show', dest='show', action='store_true',
        default=False, help='Mostra os coeficientes')
    parser.add_argument('-t', '--triad', dest='triade', action='store_true',
        default=False, help='Calcula a Tríade Maior')
    parser.add_argument('-i', '--ignore-SPN', dest='spn', action='store_true',
        default=False, help='Ignora as notas que conforme ISO 16:1975')
    parser.add_argument('-p', '--spn', dest='spntable', action='store_true',
        default=False, help='Mostra a tabela de notas (10 oit.) da ISO 16:1975')
    args = parser.parse_args()
    if len(sys.argv[1:]) == 0:
    #if args.freq == 440 and args.note == 'A4' and args.scale == 0 \
    #and not args.show and not args.spn and not args.spntable:
        print("Pelo menos uma opção tem que ser selecionada!")
        parser.print_help()
        sys.exit(1)
    freqbase = args.freq
    if args.show:
        for i in range(0, 13):
            print(intervalos[i], "  : ", calsalto(i))
        return 0
    if args.scale > 0:
        if args.spn:
            i = 1
        else:
            i = notabase
        while (i < args.scale):
            print("{0:.4f}".format(i))
            i = i * calsalto(1)
    if args.triade:
        triadeMaior = triademenor(freqbase)
        for i in range(0, len(triadeMaior)):
            print(triadeMaior[i])
    if args.spntable:
        tabelageral = []
        titulo = 'Nota\Oitava'
        for i in range(0, 11):
            titulo += "\t;" + str(i)
            tabelageral.append(freqescala(i))
        global cromatica
        print(titulo)
        for nota in range(0, len(cromatica)):
            linha = ''
            for escala in range(0, 11):
                linha += "\t;" + tabelageral[escala][nota]
            print(cromatica[nota].split(':'), linha)
    if args.note is not None:
        print(args.note, " : ", ntof(args.note), 'Hz')
    sys.exit(0)

if __name__ == '__main__':
    main()
