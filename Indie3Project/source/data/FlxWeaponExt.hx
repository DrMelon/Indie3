package data;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.input.touch.FlxTouch;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import flixel.util.FlxVelocity;
import flixel.addons.weapon.FlxWeapon;
import flixel.addons.weapon.FlxBullet;
/**
 * Expanding the FlxWeapon class to include reloading time, refire time, etc.
 * @author DrMelon
 */
class FlxWeaponExt extends FlxWeapon
{

	public var isFiring:Bool;
	public var isReloading:Bool;
	public var canFire:Bool;
	
	public var refireTime:Int;
	public var refireCount:Int;
	
	public var maxAmmo:Int;
	public var currentAmmo:Int;
	
	public var reloadTime:Int;
	public var currentReload:Int;
	
	
	public function new(Name:String, ?ParentRef:FlxSprite, ?BulletType:Class<FlxBullet>, ?BulletID:Int = 0) 
	{
		super(Name, ParentRef, BulletType, BulletID);
		currentAmmo = maxAmmo;
		
	}
	
	override public inline function runFire(Method:Int, X:Int = 0, Y:Int = 0, ?Target:FlxSprite, Angle:Int = 0):Bool
	{
		
		if (currentAmmo > 0 && canFire == true && isReloading == false)
		{
			currentAmmo--;
			refireCount = refireTime;
			return super.runFire(Method, X, Y, Target, Angle);
		}
		if (currentAmmo <= 0)
		{
			reloadWeapon();
		}
		return false;
	}
	
	public function update()
	{
		if (isReloading == true)
		{
			currentReload++;
			if (currentReload >= reloadTime)
			{
				currentReload = 0;
				isReloading = false;
				canFire = true;
			}
			canFire = false;
			return;
		}
		else if (refireCount > 0)
		{
			refireCount--;
			canFire = false;
		}
		else
		{
			canFire = true;
		}
	}
	
	public function reloadWeapon()
	{
		// RELOADING!!
		currentAmmo = maxAmmo;
		currentReload = 0;
		canFire = false;
		isReloading = true;
	}
	
	public function BuildFromWeaponsFile()
	{
		// This allows us to have modding! The weapon should read a weapon definition file and build itself from that.
	}
	
}