state("Rayman Legends")
{
	bool isLoading : "Rayman Legends.exe", 0x00AE483C, 0xF14;
	bool isOnTicketScreen : "Rayman Legends.exe", 0x00AE16B4, 0x20;
	bool isMenu : "Rayman Legends.exe", 0x00A4619C, 0x3c, 0x3c, 0x14;
}

start
{
	return old.isMenu && !current.isMenu;
}

reset
{
	return !old.isMenu && current.isMenu;
}

isLoading
{
	return current.isLoading && !current.isOnTicketScreen;
}
