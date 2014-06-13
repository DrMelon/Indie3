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
import flixel.util.FlxRandom;
/**
 * Simple enemy that runs and jumps
 * @author DrMelon
 */
class Enemy extends FlxSprite
{

	public var dead:Bool;
	public var running:Bool;
	public var jumping:Bool;
	public var changeBehaviourTimer:Int;
	public var direction:Int;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		
		// load animations
				// Load graphics / create anims
		loadGraphic("assets/images/enemy.png", true, 32, 32, true);
		
		var frameArrayRunAnim:Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
		var frameArrayDie:Array<Int> = [10, 11, 12, 13, 14, 15];
		
		
		animation.add("run", frameArrayRunAnim, 12, true);
		animation.add("die", frameArrayDie, 12, false);

		animation.play("run");
		
		
		
		running = true;
		changeBehaviourTimer = 135;
		direction = -1;
		maxVelocity.x = 320;
		maxVelocity.y = 200;
		acceleration.y = 400;
		
		height -= 4;
		
	}
	
	override public function update()
	{
		
		if (dead)
		{
			animation.play("die");
			if (animation.frameIndex == 15)
			{
				kill();
			}
		}
		
		if (running)
		{
			acceleration.x = direction*10;
		}
		if (jumping)
		{
			jumping = false;
			running = true;
			velocity.y -= 120;
		}
		
		if (changeBehaviourTimer > 0)
		{
			changeBehaviourTimer--;
		}
		else
		{
			//change behaviours
			if (running)
			{
				jumping = true;
			}
			direction = FlxRandom.intRanged( -5, 5);
			changeBehaviourTimer = FlxRandom.intRanged(60, 300);
		}
		
		if (velocity.x < 0)
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