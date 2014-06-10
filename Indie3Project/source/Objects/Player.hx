package Objects;

import flixel.FlxSprite;

/**
 * The Player object is used to allow a player to interact with the world.
 * It is attached to a player profile and can record stats etc. 
 * It has health, weapons, etc.
 *
 */
class Player extends FlxSprite
{

	var myProfile:PlayerProfile;
	//current theme
	//current weapon
	//available weapons
	var currentHealth:Int;
	var maxHealth:Int;
	var dead:Bool;
	
	var lastDamagedBy:Dynamic;
	
	
	public function new() 
	{
		// Load graphics
		dead = false;
		maxHealth = 100;
		currentHealth = 100;
	}
	
	public function LoadProfile( prof:PlayerProfile ):Void
	{
		myProfile = prof;
	}
	
	public function TakeDamage( dam:Int, source:Dynamic ):Void
	{
		// The source is used for death messages to be broadcast.
		
		currentHealth -= dam;
		if (currentHealth <= 0)
		{
			currentHealth = 0;
			// Die..!
			
		}
		
		lastDamagedBy = source;
	}
	
	public function Die():Void
	{
		if (lastDamagedBy == null)
		{
			//DeathMsg(myProfile.name + " died of natural causes.");
		}
		
		// Make a corpse, set respawn timer in game state etc.
	}
	
}