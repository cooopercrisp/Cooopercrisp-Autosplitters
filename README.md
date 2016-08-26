# Rayman Origins
This is a proposed autosplitter for the video game "Rayman Origins." Right now the autosplitter can only be used for any% cagegories because it splits based on the final lum screen and not the time trial. The timer removes loads on load screens and when restarting a level, both times when the game is loading. The splits must be manually started and the final split probably needs to be manual also.

# Rayman Legends
This is an updated autosplitter for the video game "Rayman Legends." It has been fixed with the following changes:

The time is no longer primarily tracked with game frames. Instead, the timer runs off real time and pauses during loading screens. This avoids the issue with the frame rate in gameTime being hard-coded at 60.0.

The variable "state" that determined when the timer split has been fixed and renamed to "levelState" for the sake of clarification.

The timer will not split on invasion levels, that must be manually timed. Also the final split is manual.
