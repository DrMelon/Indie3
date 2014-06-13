package objects;

import flixel.addons.weapon.FlxBullet;
import flixel.addons.weapon.FlxWeapon;
import flixel.animation.FlxAnimation;
import flixel.effects.particles.FlxEmitterExt;
import flixel.effects.particles.FlxTypedEmitter.Bounds;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;
import flixel.FlxObject;
import data.PlayerProfile;
import data.FlxWeaponExt;
import flixel.util.FlxColorUtil;

/**
 * The Player object is used to allow a player to interact with the world.
 * It is attached to a player profile and can record stats etc. 
 * It has health, weapons, etc.
 *
 */
class Player extends FlxSprite
{

	public var myProfile:PlayerProfile;
	//current theme
	public var currentWeapon:FlxWeaponExt;
	//available weapons
	public var currentHealth:Int;
	var maxHealth:Int;
	var dead:Bool;
	public var currentScore:Int;
	
	var lastDamagedBy:FlxBullet;
	
	// Reference to game state
	public var gameState:PlayState;
	
	// Blood 
	public var myBlood:FlxEmitterExt;
	var isBleeding:Bool;
	var bleedTime:Float;
	
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
		loadGraphic("assets/images/all_anim.png", true, 32, 32, true);
		
		var frameArrayRunAnim:Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
		var frameArrayStartJumping:Array<Int> = [12];
		var frameArrayMiddleJumping:Array<Int> = [13];
		var frameArrayFalling:Array<Int> = [14];
		var frameArrayIdleAnim:Array<Int> = [17];
		animation.add("idle", frameArrayIdleAnim, 12, true);
		animation.add("run", frameArrayRunAnim, 12, true);
		animation.add("jumpstart", frameArrayStartJumping, 12, false);
		animation.add("jumpmid", frameArrayMiddleJumping, 12, true);
		animation.add("falling", frameArrayFalling, 12, true);
		
		animation.play("idle");
		allowCollisions = FlxObject.ANY;
		
		
		
		
		dead = false;
		maxHealth = 100;
		currentHealth = 100;
		gameState = gs;
		
		
		// offset the graphics a little so we're standing "in" tiles
		height -= 6;
		width -= 12;
		centerOffsets();
		
		
		// blood setup
		myBlood = new FlxEmitterExt(x, y, 0);
		myBlood.makeParticles("assets/images/bloodparticle.png", 50, 1, true, 0, true);
		
		
	}
	
	public function LoadProfile( prof:PlayerProfile ):Void
	{
		myProfile = prof;
	}
	
	public function TakeDamage( dam:Int, source:FlxBullet ):Void
	{
		if (isBleeding == true)
		{
			return;
		}
		// The source is used for death messages to be broadcast.
		
		currentHealth -= dam;
		if (currentHealth <= 0)
		{
			currentHealth = 0;
			// Die..!
			
		}
		
		lastDamagedBy = source;
		
		
		
		myBlood.x = x + width / 2;
		myBlood.y = y;
		myBlood.setColor(myProfile.colour, FlxColorUtil.darken(myProfile.colour, 0.3));
		myBlood.gravity = 240;
		myBlood.endScale = new Bounds(0.15, 0.7);
		myBlood.start(true, 1.0, 0.2, 25, 0.5);
		isBleeding = true;
		bleedTime = 15;
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
		// Update Animations to be in line with what you're doing
		if (velocity.y < -5)
		{
			animation.play("jumpstart");
		}
		else if (!this.isTouching(FlxObject.FLOOR) && velocity.y < 15 && velocity.y > -15) // peak of jump
		{
			animation.play("jumpmid");
		}
		else if (!this.isTouching(FlxObject.FLOOR)) // falling
		{
			animation.play("falling");
		}
		else if (Math.abs(velocity.x) > 1.0)
		{
			animation.play("run");
		}
		else
		{
			animation.play("idle");
		}

		
		if (facing == FlxObject.LEFT)
		{
			flipX = true;
		}
		else
		{
			flipX = false;
		}
		
		if (isBleeding)
		{
			bleedTime -= FlxG.elapsed * 60;
			
		}
		if (bleedTime <= 0)
		{
			isBleeding = false;
			myBlood.on = false;
		}
		
		
		super.update();
	}
	
}