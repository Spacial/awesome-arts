(
s = Server.default;
s.boot;

// primeira função
// parametros: frequencia e amplitude
// já com valores padrao

SynthDef.new(\meusom, {
    arg freq=440, amp=0.5;
    var audio;
    audio = SinOsc.ar(freq,0,amp);
    Out.ar(0,audio);
}
).send(s);

// Lembre-se, pra parar o som é só digitar CTRL+.
// Digite no Command Line: n= Synth(\meusom) <ENTER>
// voce pode mandar a freq: n= Synth(\meusom, ,["freq",880])) <ENTER>
// voce pode mandar a freq: n= Synth(\meusom, ,["freq",880,"amp",0.7])) <ENTER>
)