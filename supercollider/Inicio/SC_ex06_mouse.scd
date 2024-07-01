(
s = Server.default;
s.boot;

// Terceira função
// execute-a e mexa o ponteiro do mouse
// "Teremin"

SynthDef.new(\mousee, {
    arg amp=0.3;
    Out.ar(0,Pan2.ar(SinOsc.ar(MouseY.kr(440,1960,1), 0, amp),MouseY.kr(-1,1,0)));
}
// se quiser ver a onda gerada, comente acima e descomente abaixo
//}.scope;
).send(s);

// Lembre-se, pra parar o som é só digitar CTRL+.
// Digite no Command Line: n= Synth(\mouse) <ENTER>
)
