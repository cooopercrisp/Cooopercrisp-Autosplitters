state("Rayman Origins")
{
	bool isNotLoading : "Rayman Origins.exe", 0x6887FC;
	bool isNotRestarting : "Rayman Origins.exe", 0x6FB91C;
	bool isNotAtEndOfLevel : "Rayman Origins.exe", 0x6FBF84;
	int gameState : "Rayman Origins.exe", 0x6FB8FC;
	int mapState : "Rayman Origins.exe", 0x68AD20;
}

start
{
	vars.isRestarting = false;
}

split
{
	return old.isNotLoading && !current.isNotLoading && !current.isNotRestarting && !current.isNotAtEndOfLevel;
}

isLoading
{
	if (current.mapState != 1 && current.mapState != 2 && current.mapState != 3 && current.gameState == 0 && current.isNotAtEndOfLevel)
	{
		vars.isRestarting = true;
	}
	if (old.gameState == 0 && current.gameState != 0)
	{
		vars.isRestarting = false;
	}
	return !current.isNotLoading || vars.isRestarting;
}
