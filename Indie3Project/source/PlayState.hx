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
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;
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
	 var background_ng:FlxSprite;
	 var background:FlxGlitchSprite;
	 
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
	 
	 
	 // HUD Stuff
	 var hudArea:FlxSprite;
	 var healthBar:FlxBar;
	 var ammoBar:FlxBar;
	 var slomoBar:FlxBar;
	 
	 
	 
	 
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		//bgColor = FlxColor.WHITE;

		
		slowMoTimer = 120;
		
		// Test map
		currentMap = new TiledLevel("assets/data/test.tmx");
		
		// Background
		background_ng = new FlxSprite(0, 0);
		background_ng.loadGraphic("assets/images/bg.png");
		background = new FlxGlitchSprite(background_ng, 8, 1, 0.03, null);
		background.x = -16;
		background.scale.x = 2;
		background.scale.y = 2;
		//background.scrollFactor.x = 0.3;
		//background.scrollFactor.y = 0.3;
		add(background);

		
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
		
		
		
		TrailArea = new FlxTrailArea(0, 0, 2048, 2048, 0.8, 3, true);
		TrailArea.add(player1);
		
		bloodArea = new FlxTrailArea(0, 0, 1024, 1024, 1.0, 1, false);
		for (bloodpart in player1.myBlood.members)
		{
			bloodArea.add(bloodpart);
		}
		
		
		add(player1.myBlood);
		add(bloodArea);
		add(currentMap.foregroundTiles);
		add(TrailArea);
		TrailArea.visible = false;
		TrailArea.color = player1.myProfile.colour;
		add(player1);
		add(player1.currentWeapon.group);
		
		// hud stuff
		hudArea = new FlxSprite(0, 200);
		hudArea.makeGraphic(320, 40, FlxColor.CHARCOAL);
		hudArea.scrollFactor.x = 0;
		hudArea.scrollFactor.y = 0;
		add(hudArea);
		
		
		
		healthBar = new FlxBar(4, 204, FlxBar.FILL_LEFT_TO_RIGHT, 320 - 8, 6, player1, "currentHealth", 0, 100, true);
		healthBar.createFilledBar(FlxColor.CHARCOAL, FlxColor.RED, true, FlxColor.SALMON);
		
		ammoBar = new FlxBar(4, 210, FlxBar.FILL_LEFT_TO_RIGHT, 320 - 8, 6, player1.currentWeapon, "currentAmmo", 0, player1.currentWeapon.maxAmmo, true);
		ammoBar.createFilledBar(FlxColor.CHARCOAL, FlxColor.GOLDEN, true, FlxColor.YELLOW);

		slomoBar = new FlxBar(4, 216, FlxBar.FILL_HORIZONTAL_INSIDE_OUT, 320 - 8, 6, this, "slowMoTimer", 0, 120, true);
		slomoBar.createFilledBar(FlxColor.CHARCOAL, FlxColor.BLUE, true, FlxColor.ROYAL_BLUE);
		
		healthBar.fixedPosition = true;
		ammoBar.fixedPosition = true;
		slomoBar.fixedPosition = true;
		healthBar.scrollFactor.x = 0;
		healthBar.scrollFactor.y = 0;
		ammoBar.scrollFactor.x = 0;
		ammoBar.scrollFactor.y = 0;
		slomoBar.scrollFactor.x = 0;
		slomoBar.scrollFactor.y = 0;
		add(healthBar);
		add(ammoBar);
		add(slomoBar);
		
		
		FlxG.camera.flash(FlxColor.GOLDEN, 0.4);
		
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
			TrailArea.resetTrail();
			FlxG.timeScale = 0.7;
			TrailArea.visible = true;
			inSlowMo = true;
		}
	}
	
	public function ExitSlowMo():Void
	{
		if (inSlowMo == true)
		{
			FlxG.timeScale = 1.0;
			TrailArea.visible = false;
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
			if (FlxG.keys.pressed.C) // slowmo power
			{
				if (inSlowMo == false)
				{
					FlxG.camera.shake(0.005, 0.2);
					FlxG.camera.flash(currentPlayer.myProfile.colour, 0.3);
				}
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
			slowMoTimer--;
			if (slowMoTimer <= 0)
			{
				ExitSlowMo();
				slowMoTimer = 120;
			}
		}
		
		//background_ng.pixels = bloodArea.pixels;
	
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
		
		
	
	}
}