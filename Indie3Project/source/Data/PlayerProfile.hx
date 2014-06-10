package ;
import flixel.util.FlxColor;

/**
 * The PlayerProfile class is, as the name suggests, for player profiles.
 * A profile has information like the player's name, favourite colour, and preferred weapon set/customization options.
 */
class PlayerProfile
{
	public var name:String;
	public var colour:FlxColor;
	// weapon set
	// favourite theme/costume
	
	
	public function new() 
	{
		name = "Player";
		colour = FlxColor.RED;
	}
	
	
	
}