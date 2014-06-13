package;

import data.PlayerProfile;
import flixel.addons.ui.FlxSlider;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSave;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;
import Colour;
/**
 * The main menu, which leads into various other menus, like the profiles menu or pregame
 */
class MenuState extends FlxState
{
	/**
	 * Profile stuff
	 * 
	 */
	var profileList:Array<PlayerProfile>;
	var profileSaveData:FlxSave;
	
	
	/**
	 * Buttons! O:
	 */
	
	 var pregameMenuButton:FlxButton;
	// var profilesMenuButton:FlxButton;
	// var optionsMenuButton:FlxButton;
	
	/**
	 * Colour box
	 */
	var colourBox:FlxSprite;
	var pickColour:Colour;
	
	
	/**
	 * RGB sliders
	 */
	var rSlider:FlxSlider;
	var gSlider:FlxSlider;
	var bSlider:FlxSlider;
	
	 
	

	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	override public function create():Void
	{
		super.create();
		
		// Load profile data (if it exists - if not, create a blank profile, add it to the list, and save)
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
		
		pregameMenuButton = new FlxButton( 0, 0, "Play", switchToPregame);
		pregameMenuButton.x = FlxG.width / 1.4 - pregameMenuButton.width / 2;
		pregameMenuButton.y = FlxG.height / 2 - pregameMenuButton.height / 2;
		//profilesMenuButton = new FlxButton( 16, 32, "Profile", switchToProfiles);
		//optionsMenuButton = new FlxButton( 16, 64, "Options");
		
		var colourText:FlxText = new FlxText(16, 32, 0, "Favourite Colour: ", 8, true);
		colourBox = new FlxSprite(128, 32);
		colourBox.makeGraphic(16, 16, FlxColor.WHITE);
		
		pickColour = new Colour();
		pickColour.r = FlxColorUtil.getRed(profileList[0].colour);
		pickColour.g = FlxColorUtil.getGreen(profileList[0].colour);
		pickColour.b = FlxColorUtil.getBlue(profileList[0].colour);
		
		// RGB sliders & text
		rSlider = new FlxSlider(pickColour, "r", 16, 48, 0, 255, 100, 8, 3, FlxColor.WHITE, FlxColor.GRAY);
		add(rSlider);
		gSlider = new FlxSlider(pickColour, "g", 16, 96, 0, 255, 100, 8, 3, FlxColor.WHITE, FlxColor.GRAY);
		add(gSlider);
		bSlider = new FlxSlider(pickColour, "b", 16, 142, 0, 255, 100, 8, 3, FlxColor.WHITE, FlxColor.GRAY);
		add(bSlider);		
		
		
		
		add(colourText);
		add(colourBox);
		
		add(pregameMenuButton);
		
		
		// add tutorial text
		var tutTex:FlxText = new FlxText(16, 182, 0, "Arrows: Move, X: Jump, C: Shoot, V: SLO-MO!!!");
		var tutTex2:FlxText = new FlxText(16, 192, 0, "Kill slimes! Try not to die!!");
		var tutTex3:FlxText = new FlxText(16, 202, 0, "If you're out of ammo, let go of C to reload!");
		var tutTex4:FlxText = new FlxText(16, 212, 0, "Code: @DrMelon  ---  Art: @tuffbun");
		var tutTex5:FlxText = new FlxText(16, 222, 0, "Music: Pumped by RoccoW");
		add(tutTex);
		add(tutTex2);
		add(tutTex3);
		add(tutTex4);
		add(tutTex5);
		//add(profilesMenuButton);
		//add(optionsMenuButton);
		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		colourBox.color = FlxColorUtil.getColor32(255, pickColour.r, pickColour.g, pickColour.b);
	}	
	
	
	/**
	 * Button functions.
	 */
	public function switchToPregame():Void
	{
		profileSaveData.data.colours[0] = colourBox.color;
		profileSaveData.flush();
		FlxG.switchState(new PregameState());
	}
	
	public function switchToProfiles():Void
	{
		FlxG.switchState(new ProfileState());
	}	
}