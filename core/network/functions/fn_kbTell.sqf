private ["_sender", "_receiver", "_topic", "_sentence", "_arguments", "_radio"];

_sender = _this select 0;
_receiver = _this select 1;
_topic = _this select 2;
_sentence = _this select 3;
_arguments = _this select 4;
_radio = _this select 5;

if (local _sender) exitWith {
    _sender kbTell [_receiver, _topic, _sentence, _arguments, _radio];
};

kbTellGlobal = _this;
if (isServer) exitWith {
    (owner _sender) publicVariableClient "kbTellGlobal";
};

publicVariableServer "kbTellGlobal";