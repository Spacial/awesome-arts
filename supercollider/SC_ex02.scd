(
// inicializa o server do SuperCollider
s = Server.default;
s.boot;

//toca um som
//pra tocar selecione a linha abaixo e pressione Ctrl+ENTER
{SinOsc.ar}.play;

//toca um som de 800Hz
// pra tocar selecione a linha abaixo e pressione CTRL+ENTER
{SinOsc.ar(800,0,0.5)}.play;

//pra parar pressionte CTRL+.
//experimente comentar e mudar o valor de 800
)