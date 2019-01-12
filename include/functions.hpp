class CfgFunctions
{
    #include "..\common\client\ais_injury\cfgFunctionsAIS.hpp"
    #include "..\common\client\vip_cmn\fn\vip_cmn_fnc.hpp"
    #include "..\common\client\vip_lit\fn\vip_lit_fnc.hpp"
    #include "..\functions\aiArtillery\functions.hpp"
    class ToothFunctions
	{
		class Tooth
		{
			#include "..\functions\Tooth\Functions.hpp"
			class preinit {
                preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                recompile = 0; // 1 to recompile the function upon mission start
            };
            class postinit {
                preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                recompile = 0; // 1 to recompile the function upon mission start
            };
        };
	};
};
