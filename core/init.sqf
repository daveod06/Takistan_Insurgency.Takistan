/*By Mphillips'Hazey' + Sacha Ligthert + Phronk

Special Thanks:
	ArmA Tactical Combat Applications Group - Tactical Realism http://www.ATCAG.com
	Tangodown - Tactical Gaming Community http://www.tangodown.nl/
	Whiskey Company - Tactical Realism http://www.TheWhiskeyCo.com/
*/
#include <modules\modules.hpp>
#ifndef execNow
#define execNow call compile preProcessFileLineNumbers
#endif
#ifdef cacheScript
execNow "core\modules\cacheScript\cache.sqf";
#endif
#ifdef intelSpawn
if(isServer)then{[]execVM "core\modules\cacheScript\spawnIntel.sqf";};
#endif