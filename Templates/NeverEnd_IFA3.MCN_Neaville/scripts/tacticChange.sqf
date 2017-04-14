
_tactics = [0,1,2,3,4,5,6];

bluTactic = selectRandom _tactics;

opTactic = selectRandom _tactics;

publicVariable "bluTactic";
publicVariable "opTactic";

// 0 = Push all Lanes
// 1 = Push Only Top
// 2 = Push Only Bottom
// 3 = Push Top Slightly
// 4 = Push Bottom Slightly
// 5 = Push Middle Slightly
// 6 = Push Only Middle