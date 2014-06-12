package;

import flixel.addons.effects.FlxTrail;
import flixel.addons.tile.FlxTilemapExt;
import flixel.addons.weapon.FlxBullet;
import flixel.addons.weapon.FlxWeapon;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.effects.FlxTrailArea;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import objects.Player;
import data.PlayerProfile;
import data.FlxWeaponExt;

/**
 * The actual gameplay is here; taking the information from the pregame, we set up the players, and add a timer
 */
class PlayState extends FlxState
{
	/**
	 * Handy deathmatch variables.
	 */
	
	 var numPlayers:Int;
	 var timeRemaining:Float;
	 
	 
	 // Tilemap stuff
	 var currentMap:TiledLevel;
	 
	 // Player list
	 var playerList:Array<Player>;
	 
	 // Weapon List
	 var weaponList:Array<FlxWeaponExt>;
	
	 // Profiles List
	 var profileList:Array<PlayerProfile>;
	 var profileSaveData:FlxSave;
	 
	 // For slomo stuff:
	 var TrailArea:FlxTrailArea;
	 var inSlowMo:Bool;
	 var slowMoTimer:Int;
	 
	 // For blood stuff
	 var bloodArea:FlxTrailArea;
	 
	 
	 
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		bgColor = FlxColor.WHITE;

		
		// Test map
		currentMap = new TiledLevel("assets/data/test.tmx");
		
		// Create generic default map

		
		// Create players based on pregame data (todo)
		// right now it just loads the first player profile
		profileList = new Array<PlayerProfile>();
		profileSaveData = new FlxSave();
		profileSaveData.bind("ProfileData");
		if (profileSaveData.data.names == null)
		{
			// Create the lists, add blank entry
			profileSaveData.data.names = new Array<String>();
			profileSaveData.data.colours = new Array<Int>();
			profileSaveData.data.kills = new Array<Int>();
			profileSaveData.data.deaths = new Array<Int>();
			
			profileSaveData.data.names.push("Player");
			profileSaveData.data.colours.push(FlxColor.RED);
			profileSaveData.data.kills.push(0);
			profileSaveData.data.deaths.push(0);
			
			var newProf:PlayerProfile = new PlayerProfile();
			newProf.name = "Player";
			newProf.colour = FlxColor.RED;
			newProf.lifetimeKills = 0;
			newProf.lifetimeDeaths = 0;
			profileList.push(newProf);
			
			profileSaveData.flush(); //save
		}
		else
		{
			// load them into the profile list
			for (number in 0 ... profileSaveData.data.names.length)
			{
				var newProf:PlayerProfile = new PlayerProfile();
				newProf.name = profileSaveData.data.names[number];
				newProf.colour = profileSaveData.data.colours[number];
				newProf.lifetimeKills = profileSaveData.data.kills[number];
				newProf.lifetimeDeaths = profileSaveData.data.deaths[number];
				profileList.push(newProf);				
			}
		}	
		
		playerList = new Array<Player>();
		var player1:Player = new Player(this, 0, 0);
		trace(profileList[0]);
		player1.LoadProfile(profileList[0]);
		playerList.push(player1);
		
		
		CreateWeapons();
		
		player1.currentWeapon = weaponList[0];
		weaponList[0].setParent(player1, 0, 0, true);
		
		FlxG.camera.follow(player1, FlxCamera.STYLE_PLATFORMER, null, 0.5);
		
		
		FlxG.worldBounds.setSize(2048, 2048);
		
		
		
		TrailArea = new FlxTrailArea(0, 0, 2048, 2048, 0.8, 1, true);
		TrailArea.add(player1);
		
		bloodArea = new FlxTrailArea(0, 0, 1024, 1024, 1.0, 1, false);
		for (bloodpart in player1.myBlood.members)
		{
			bloodArea.add(bloodpart);
		}
		
		
		add(player1.myBlood);
		add(bloodArea);
		add(currentMap.foregroundTiles);
		add(player1);

		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}
	
	public function EnterSlowMo():Void
	{
		if (inSlowMo == false)
		{
			FlxG.timeScale = 0.7;
			add(TrailArea);
			inSlowMo = true;
		}
	}
	
	public function ExitSlowMo():Void
	{
		if (inSlowMo == true)
		{
			FlxG.timeScale = 1.0;
			remove(TrailArea);
			inSlowMo = false;
		}
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		// Collide players with the tilemap
		for (currentPlayer in playerList)
		{
			currentMap.collideWithLevel(currentPlayer);
			if (FlxG.keys.pressed.X) // genericise to firekey for each player
			{
				currentPlayer.fireWeapon();
			}			
			if (FlxG.keys.pressed.L) // slowmo test
			{
				//FlxG.camera.shake(0.005, 0.2);
				EnterSlowMo();
			}
			if (FlxG.keys.pressed.K) // blood test
			{
				currentPlayer.TakeDamage(0, null);
			}
		}
		
		// Update weapons
		for (currentWeapon in weaponList)
		{
			currentWeapon.update();
		}
		
		if (inSlowMo)
		{
			slowMoTimer++;
			if (slowMoTimer >= 60)
			{
				ExitSlowMo();
				slowMoTimer = 0;
			}
		}
	
		//FlxG.collide();
	}	
	
	
	public function CreateWeapons():Void
	{
		// Creates all the available weapons! (TODO: load from file?)
		weaponList = new Array<FlxWeaponExt>();
		// First though, create the bullets.
		
		
		
		// Little pistol blaster thing.
		var testPistol:FlxWeaponExt = new FlxWeaponExt("Test Pistol", null, FlxBullet);
		testPistol.makeImageBullet(50, "assets/images/shots_blaster.png", 0, 0, false, 16, 1, false, false);
		testPistol.setBulletSpeed(200);
		testPistol.setBulletLifeSpan(2.5);
		testPistol.maxAmmo = 10;
		testPistol.refireTime = 5;
		testPistol.currentAmmo = 10;
		testPistol.reloadTime = 30;
		weaponList.push(testPistol);
		add(testPistol.group);
		
	
	}
}