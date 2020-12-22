//Vehicle Logic --------------------------
//Set params
params ["_moveLocation"];
//----------------------------------------

//move to thrown object location
spawnVehicle move _moveLocation;
//allow command to be processed
sleep 3;
//while the spawn vehicle is still alive, and completed it's move command, we wait
while { ( (alive spawnVehicle) && !(unitReady spawnVehicle) ) } do
{
	   sleep 1;
};
//if the vehicle is still alive and ready, land
if (alive spawnVehicle) then
{
	   spawnVehicle land "LAND";
};
//now wait a bit so everyone gets out
sleep 20;
//follow same procedure as above to return to previous location
spawnVehicle move vehicleHome;
sleep 3;
while { ( (alive spawnVehicle) && !(unitReady spawnVehicle) ) } do
{
	   sleep 1;
};
if (alive spawnVehicle) then
{
	   spawnVehicle land "LAND";
};
//----------------------------------------