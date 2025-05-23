#define MODULE(module) d##_mdl_##module
#define FUNC(module,function) d##_fnc_##module##_##function
#define FUNCTION(module,file) format ["%1\functions\fn_%2.sqf", #module, #file]
#define FSM(module,file) format ["%1\fsm\%2.fsm", #module, #file]
#define GVAR(variable) d##_##variable
#define QUOTE(qtext) #qtext
#define DIALOG(name,ctrl) (uiNamespace getVariable name) displayCtrl ctrl

#define QMODULE(module) QUOTE(MODULE(module))
#define QGVAR(variable) QUOTE(GVAR(variable))

#define PARAMS_1(param1) param1 = _this select 0
#define PARAMS_2(param1,param2) PARAMS_1(param1); param2 = _this select 1
#define PARAMS_3(param1,param2,param3) PARAMS_2(param1,param2); param3 = _this select 2
#define PARAMS_4(param1,param2,param3,param4) PARAMS_3(param1,param2,param3); param4 = _this select 3
#define PARAMS_5(param1,param2,param3,param4,param5) PARAMS_4(param1,param2,param3,param4); param5 = _this select 4
#define PARAMS_6(param1,param2,param3,param4,param5,param6) PARAMS_5(param1,param2,param3,param4,param5); param6 = _this select 5
#define PARAMS_7(param1,param2,param3,param4,param5,param6,param7) PARAMS_6(param1,param2,param3,param4,param5,param6); param7 = _this select 6
#define PARAMS_8(param1,param2,param3,param4,param5,param6,param7,param8) PARAMS_7(param1,param2,param3,param4,param5,param6,param7); param8 = _this select 7
#define PARAMS_9(param1,param2,param3,param4,param5,param6,param7,param8,param9) PARAMS_8(param1,param2,param3,param4,param5,param6,param7,param8); param9 = _this select 8

#define __corePP(module) call compile preprocessFileLineNumbers format ["core\%1\init.sqf", #module]
#define __coreVM(module) execVM format ["core\%1\init.sqf", #module]
#define __module(module) call compile preprocessFileLineNumbers format ["%1\init.sqf", module]
#define __submodulePP(module) call compile preprocessFileLineNumbers format ["%1\modules\%2.sqf", #module, QUOTE(THIS_MODULE)]
#define __submoduleVM(module) execVM format ["%1\modules\%2.sqf", #module, QUOTE(THIS_MODULE)]
#define __submoduleRE(module) format ["%1\modules\%2.sqf", #module, QUOTE(THIS_MODULE)]
#define __handlerPP(module) call compile preprocessFileLineNumbers format ["%1\handle.sqf", module]
#define __function(file) format ["%1\functions\fn_%2.sqf", QUOTE(THIS_MODULE), #file]
#define __profile(option) format ["pdt|%1|%2", QUOTE(THIS_MODULE), option]
#define __fsm(file) execFSM format ["%1\fsm\%2.fsm", QUOTE(THIS_MODULE), #file]
#define __log diag_log text format ["%1: %2", toUpper(QUOTE(THIS_MODULE)),

#define __ccppfln(file) call compile preprocessFileLineNumbers #file
#define __cppfln(function,file) function = compile preprocessFileLineNumbers #file

#define __addDead(xunitx) if !(isNil QMODULE(cleanup)) then {GVAR(allunits_add) set [count GVAR(allunits_add), xunitx]}