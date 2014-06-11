package data;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;

/**
 * The PlayerProfile class is, as the name suggests, for player profiles.
 * A profile has information like the player's name, favourite colour, and preferred weapon set/customization options.
 */
class PlayerProfile
{
	public var name:String;
	public var colour:Int;
	// weapon set
	// favourite theme/costume
	public var lifetimeKills:Int;
	public var lifetimeDeaths:Int;
	
	public function new() 
	{
		name = "Player";
		colour = FlxColor.RED;
		lifetimeKills = 0;
		lifetimeDeaths = 0;
	}
	
	
	
}