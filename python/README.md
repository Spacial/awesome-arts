# Python

Lista dos utilitários escritos em python:
- *fnf* : frequencia e notas;

## Licença 

Licenciado por

* *GPL v3 ou Superior*: veja [LICENSE](LICENSE).

## FNF

Ajuda (_fnf -h_):

```
Uso: fnf.py [-n [NOTA]] [-f [FREQUENCIA]] [-s [ESCALA]] [-w] [-t] [-i] [-p]

fnf v0.1.1

As opções
  -n [NOTA], --note [NOTA]
                        Nota base (formato X0A (nota, oitava e acidente).
                        Padrão: A4 (exemplos: B3#, D8b)
  -f [FREQUENCIA], --frequency [FREQUENCIA]
                        Frequência base (padrão: 440 Hz).
                        pode ser usada pra mudar a base pra tríade
  -s [ESCALA], --scale [ESCALA]
                        Gera escala até o número Hz indicado
                        (vai gerar todas as frequencias das notas até a indicada)
  -w, --show            Mostra os coeficientes 
                        Estes coeficientes são o quanto que se multiplica a frequencia base pra chegar no salto
  -t, --triad           Calcula a Tríade Maior
                        Calcula a  3a Maior e 5a Justa a partir da fundamental (que pode ser trocada no -f HZ)
  -i, --ignore-SPN      Ignora as notas que conforme ISO 16:1975
                        (ao invez de começar em 16.352 Hz, começa em 1 - sai do temperamento do A4/440 Hz)
  -p, --spn             Mostra a tabela de notas (10 oit.) da ISO 16:1975
                        Gera toda a tabela de frequencias x notas da oitava 0 até a oitava 10 (inclusive)
```                        
