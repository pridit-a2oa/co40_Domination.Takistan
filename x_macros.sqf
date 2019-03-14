#define FUNC(module,funcname) d##_fnc_##module##_##funcname
#define MODULE(type,module) d##_mdl_##type##_##module
#define SCRIPT(module,file) format ["%1\scripts\%2.sqf", #module, #file]
#define FSM(module,file) format ["%1\fsm\%2.fsm", #module, #file]

#define GVAR(varname) d##_##varname
#define QUOTE(qtext) #qtext
#define QGVAR(varname) QUOTE(GVAR(varname))
#define GV(obje,varname) (obje getVariable #varname)
#define GV2(obje,varname) (obje getVariable varname)

#define PARAMS_1(param1) param1 = _this select 0
#define PARAMS_2(param1,param2) PARAMS_1(param1); param2 = _this select 1
#define PARAMS_3(param1,param2,param3) PARAMS_2(param1,param2); param3 = _this select 2
#define PARAMS_4(param1,param2,param3,param4) PARAMS_3(param1,param2,param3); param4 = _this select 3
#define PARAMS_5(param1,param2,param3,param4,param5) PARAMS_4(param1,param2,param3,param4); param5 = _this select 4
#define PARAMS_6(param1,param2,param3,param4,param5,param6) PARAMS_5(param1,param2,param3,param4,param5); param6 = _this select 5
#define PARAMS_7(param1,param2,param3,param4,param5,param6,param7) PARAMS_6(param1,param2,param3,param4,param5,param6); param7 = _this select 6
#define PARAMS_8(param1,param2,param3,param4,param5,param6,param7,param8) PARAMS_7(param1,param2,param3,param4,param5,param6,param7); param8 = _this select 7

#define __core(module) call compile preprocessFileLineNumbers format ["core\%1\init.sqf", #module]
#define __module(module) call compile preprocessFileLineNumbers format ["%1\init.sqf", #module]
#define __submodule(module) call compile preprocessFileLineNumbers format ["%1\modules\%2.sqf", #module, QUOTE(THIS_MODULE)]

#define __function(file) format ["%1\functions\fn_%2.sqf", QUOTE(THIS_MODULE), #file]
#define __script(file) format ["%1\scripts\%2.sqf", QUOTE(THIS_MODULE), #file]
#define __fsm(file) execFSM format ["%1\fsm\%2.fsm", QUOTE(THIS_MODULE), #file]

#define __ccppfln(xfile1) call compile preprocessFileLineNumbers #xfile1
#define __cppfln(xdfunc,xfile2) xdfunc = compile preprocessFileLineNumbers #xfile2

#define __uiGetVar(uvarname) (uiNamespace getVariable #uvarname)

#define __pGetVar(pvarname) (player getVariable #pvarname)
#define __pSetVar player setVariable