/*
    Author: Karel Moricky
    Modified by Tonic for function white-listing.

    Description:
    Execute received remote execution

    Parameter(s):
    0:
            BOOL - true to execute on every client, false to execute it on server only
            OBJECT - the function will be executed only where unit is local [default: everyone]
            GROUP - the function will be executed only on client who is member of the group
            SIDE - the function will be executed on all players of the given side
            NUMBER - the function will be executed only on client with the given ID
            ARRAY - array of previous data types
    1: STRING - function name
    2: ANY - function params
    
    Returns:
    BOOL - true if function was executed successfully
*/

#define THIS_MODULE network
#define GVAR(variable) d##_##variable
#define FUNC(module,function) d##_fnc_##module##_##function

private ["_target", "_functionName", "_params", "_isCall", "_mode"];

_target         = [_this, 0, false] call FUNC(common,param);
_functionName   = [_this, 1, ""] call FUNC(common,param);
_params         = [_this, 2, []] call FUNC(common,param);
_isCall         = [_this, 3, true] call FUNC(common,param);
_mode           = [_this, 4, 0] call FUNC(common,param);

if (_mode == 0 && {isMultiplayer}) then {
    if !(isServer) exitWith {
        BIS_fnc_MP_packet = [_target, _functionName, _params, _isCall, 0];
        
        publicVariableServer "BIS_fnc_MP_packet";
    };
    
    //--- Single execution
    private ["_ownerID", "_serverID"];
    
    _serverID = owner (missionNamespace getVariable ["bis_functions_mainscope", objNull]); //--- Server ID is not always 0
    
    //--- Server process
    switch (typeName _target) do {
        case "OBJECT": {
            _ownerID = owner _target;
        };
        case "BOOL": {
            _ownerID = [_serverID, -1] select _target;
        };
        case "SCALAR": {
            _ownerID = _target;
        };
        case "STRING";
        case "GROUP";
        case "SIDE": {
            _ownerID = -1;
        };
    };
    
    BIS_fnc_MP_packet = [_target, _functionName, _params, _isCall, 1];
            
    //--- Send to clients
    if (_ownerID < 0) then {
        //--- Everyone
        publicVariable "BIS_fnc_MP_packet";
    } else {
        if (_ownerID != _serverID) then {
            //--- Client
            _ownerID publicVariableClient "BIS_fnc_MP_packet";
        };
    };
    
    //--- Server execution (for all or server only)
    if (_ownerID < 0 || {_ownerID == _serverID}) then {
        BIS_fnc_MP_packet call FUNC(THIS_MODULE,mp);
    };
} else {
    //--- Client
    private ["_function"];
    
    _function = call compile format ["d_fnc_network_%1", _functionName];
    
    if (_isCall) then {
        [_target, _params] call _function;
    } else {
        [_target, _params] spawn _function;
    };
    
    true
};