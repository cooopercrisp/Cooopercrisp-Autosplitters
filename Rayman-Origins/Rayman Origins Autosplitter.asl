state("Rayman Origins")
{
	bool isNotLoading : "Rayman Origins.exe", 0x6887FC;
	bool isNotRestarting : "Rayman Origins.exe", 0x6FB91C;
	bool isNotAtEndOfLevel : "Rayman Origins.exe", 0x6FBF84;
}

split
{
	return old.isNotLoading && !current.isNotLoading && !current.isNotRestarting && !current.isNotAtEndOfLevel;
}

isLoading
{
	return !current.isNotLoading;
}
