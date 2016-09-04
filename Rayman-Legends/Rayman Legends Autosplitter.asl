state("Rayman Legends")
{
	bool isLoading : 0x00AE483C, 0xf14;
	bool isOnTicketScreen : 0x00AE16B4, 0x20;
	bool isMenu : 0x00A4619C, 0x3c, 0x3c, 0x14;
	int levelState : 0x00AE4A40, 0x5a0, 0x12c;
}

start
{
	return old.isMenu && !current.isMenu;
}

reset
{
	return !old.isMenu && current.isMenu;
}

split
{
	return old.levelState == 37 && current.levelState == 38;
}

isLoading
{
	return current.isLoading && !current.isOnTicketScreen;
}
