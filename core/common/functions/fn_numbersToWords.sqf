private ["_numbers", "_words", "_list", "_number"];

_numbers = toArray _this;
_words = [];
_list = [
    "zero",
    "one",
    "two",
    "three2",
    "four2",
    "five2",
    "six",
    "seven",
    "eight",
    "nine2"
];

for "_i" from 0 to ((count _numbers) - 1) do {
    _number = toString [_numbers select _i];

    _words = _words + [_list select (parseNumber _number)];
};

_words