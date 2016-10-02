usage: fnf.py [-h] [-v] [-n [NOTE]] [-f [FREQ]] [-s [SCALE]] [-w] [-t] [-i]
              [-p]

fnf v0.1.1

optional arguments:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
  -n [NOTE], --note [NOTE]
                        Nota base (formato X0A (nota, oitava e acidente).
                        Padrão: A4
  -f [FREQ], --frequency [FREQ]
                        Frequência base (padrão: 440 Hz).
  -s [SCALE], --scale [SCALE]
                        Gera escala até o Hz indicado
  -w, --show            Mostra os coeficientes
  -t, --triad           Calcula a Tríade Maior
  -i, --ignore-SPN      Ignora as notas que conforme ISO 16:1975
  -p, --spn             Mostra a tabela de notas (10 oit.) da ISO 16:1975
