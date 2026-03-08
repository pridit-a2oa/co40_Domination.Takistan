((_this select 1) select 0) enableSimulation ((_this select 1) select 1);

if (isServer) then {
    X_JIP setVariable [
        "d_inanimate",
        switch ((_this select 1) select 1) do {
            case true: {(X_JIP getVariable "d_inanimate") - [(_this select 1) select 0]};
            case false: {(X_JIP getVariable "d_inanimate") + [(_this select 1) select 0]};
        },
        true
    ];
};