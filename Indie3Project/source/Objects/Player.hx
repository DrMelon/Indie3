package objects;

import flixel.addons.weapon.FlxBullet;
import flixel.addons.weapon.FlxWeapon;
import flixel.animation.FlxAnimation;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;
import flixel.FlxObject;
import data.PlayerProfile;

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
	public var currentWeapon:FlxWeapon;
	//available weapons
	var currentHealth:Int;
	var maxHealth:Int;
	var dead:Bool;
	public var currentScore:Int;
	
	var lastDamagedBy:FlxBullet;
	
	// Reference to game state
	public var gameState:PlayState;
	
	public function new( gs:PlayState, X:Int = 0, Y:Int = 0 ) 
	{
		super(X,Y);
		// Load FlxControl plugin, handy for platforming
		if (FlxG.plugins.get(FlxControl) == null)
		{
			FlxG.plugins.add(new FlxControl());
		}
		
		// Setup flxcontrol plugin
		FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true);
		FlxControl.player1.setCursorControl(false, false, true, true);
		FlxControl.player1.setJumpButton("Z", FlxControlHandler.KEYMODE_JUST_DOWN, 196, FlxObject.FLOOR, 250, 100);
		FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
		FlxControl.player1.setGravity(0, 400);			
		
		// Load graphics / create anims
		loadGraphic("assets/images/placeholder2.png", true, 32, 32, true);
		
		var frameArrayRunAnim:Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
		//var frameArrayStartJumping:Array<Int> = [6];
		//var frameArrayMiddleJumping:Array<Int> = [7];
		//var frameArrayFalling:Array<Int> = [8];
		//animation.add("idle", frameArrayIdleAnim, 12, true);
		animation.add("run", frameArrayRunAnim, 12, true);
		//animation.add("jumpstart", frameArrayStartJumping, 12, true);
		//animation.add("jumpmid", frameArrayMiddleJumping, 12, true);
		//animation.add("falling", frameArrayFalling, 12, true);
		
		animation.play("run");
		
		
		
		
		
		dead = false;
		maxHealth = 100;
		currentHealth = 100;
		gameState = gs;
		
		
		// offset the graphics a little so we're standing "in" tiles
		height -= 4;
		width -= 12;
		centerOffsets();
		
		
		
	}
	
	public function LoadProfile( prof:PlayerProfile ):Void
	{
		myProfile = prof;
	}
	
	public function TakeDamage( dam:Int, source:FlxBullet ):Void
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
	
	public function fireWeapon()
	{
		currentWeapon.fire();
	}
	
	override public function update()
	{
		if (facing == FlxObject.LEFT)
		{
			flipX = true;
		}
		else
		{
			flipX = false;
		}
		
		
		super.update();
	}
	
}