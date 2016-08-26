state("Rayman Origins")
{
	bool isNotLoading : "Rayman Origins.exe", 0x6887FC;
	bool isNotRestarting : "Rayman Origins.exe", 0x6FB91C;
	bool isNotAtEndOfLevel : "Rayman Origins.exe", 0x6FBF84;
	bool isNotPaused : "Rayman Origins.exe", 0x68A994, 0x30;
}

split
{
	return old.isNotLoading && !current.isNotLoading && !current.isNotRestarting && !current.isNotAtEndOfLevel;
}

isLoading
{
	if (current.isNotAtEndOfLevel && (!current.isNotLoading || !current.isNotRestarting) && current.isNotPaused)
	{
		return true;
	}
	if (current.isNotAtEndOfLevel || current.isNotLoading && current.isNotRestarting)
	{
		return false;
	}
}
