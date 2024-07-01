(
s = Server.default;
s.boot;

// Segunda função
// parametros: frequencia e amplitude, e a onda
// já com valores padrao

SynthDef.new(\outrosom, {
    arg freq=440, pStart= -1, pEnd=1, amp=0.3;
    var audio, env, onda, panLine;
    panLine = Line.kr(pStart,pEnd,5);
    onda = Env.new([0,1,0.9,0],[1,0.5,1],[-5,0,-5]);
    env = EnvGen.ar(onda,doneAction:2);
    Out.ar(0,Pan2.ar(SinOsc.ar(freq, 0, amp)*env,panLine));
    // pra ver a onde que forma, descomente a linha abaixo
    onda.plot;
}

).send(s);

// Lembre-se, pra parar o som é só digitar CTRL+.
// Digite no Command Line: n= Synth(\outrosom) <ENTER>
)