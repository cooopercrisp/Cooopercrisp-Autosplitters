state("Rayman Legends")
{
	bool isLoading : 0xAE483C, 0xF14;
	bool isOnTicketScreen : 0xAE16B4, 0x20;
	bool isMenu : 0xA4619C, 0x3C, 0x3C, 0x14;
	int levelState : 0xAE7B2C, 0x788, 0x358, 0x6CC, 0xC, 0x12C;
	int gameFrames : 0x575C8, 0x0;
}

start
{
	vars.wasAtEndOfLevel = false;
	vars.gameFramesAtStart = current.gameFrames;
	vars.splitFrame = null;
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
		vars.wasAtEndOfLevel = true;
	}
	if (old.levelState == 10 && current.levelState == 12 && current.wasAtEndOfLevel)
	{
		current.wasAtEndOfLevel = false;
		vars.splitFrame = current.gameFrames + 84;
	}
	if (current.gameFrames >= vars.splitFrame)
	{
		current.splitFrame = null;
		return true;
	}
}

isLoading
{
	return current.isLoading && !current.isOnTicketScreen;
}
