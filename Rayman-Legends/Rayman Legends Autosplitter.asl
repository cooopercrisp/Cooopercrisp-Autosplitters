levelState("Rayman Legends")
{
	bool isLoading : "Rayman Legends.exe", 0x00AE483C, 0xf14;
	bool isOnTicketScreen : "Rayman Legends.exe", 0x00AE16B4, 0x20;
	bool isMenu : "Rayman Legends.exe", 0x00A4619C, 0x3c, 0x3c, 0x14;
	int levelState : "Rayman Legends.exe", 0x00AE1678, 0x460, 0x5C8, 0x270, 0x69C, 0x7E4;
	int gameFrames : "Rayman Legends.exe", 0x000575C8, 0;
}

start
{
	current.wasAtEndOfLevel = false;
	current.gameFramesAtStart = current.gameFrames;
	current.splitFrame = null;

	return old.isMenu && !current.isMenu;
}

reset
{
	return !old.isMenu && current.isMenu;
}

split
{
	if (current.levelState == 16)
	{
		current.wasAtEndOfLevel = true;
	}
	if (old.levelState == 10 && current.levelState == 12 && current.wasAtEndOfLevel)
	{
		current.wasAtEndOfLevel = false;
		current.splitFrame = current.gameFrames + 84;
	}
	if (current.gameFrames >= current.splitFrame)
	{
		current.splitFrame = null;
		return true;
	}
}

isLoading
{
	return current.isLoading && !current.isOnTicketScreen;
}
