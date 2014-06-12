package;

import data.PlayerProfile;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSave;

/**
 * The profile manager lets you customize player profiles.
 */
class ProfileState extends FlxState
{
	// List of profiles.
	var profileList:Array<PlayerProfile>;
	
	var profileSaveData:FlxSave;
	
	var currentProfile:Int;
	
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
			
		}
		
		
		
		// UI Stuff
		
		/// Profile display
		var nameText:FlxText = new FlxText(16, 16, 0, "Name: " + profileList[0].name, 8, true);
		var colourText:FlxText = new FlxText(16, 32, 0, "Favourite Colour: ", 8, true);
		var colourBox:FlxSprite = new FlxSprite(64, 32);
		colourBox.makeGraphic(16, 16, profileList[0].colour);
		
		
		// Create back button
		var backButton:FlxButton = new FlxButton(0, FlxG.height - 64, "Save & Go Back", goBack);
		
		
		add(nameText);
		add(colourText);
		add(colourBox);
		add(backButton);
	}
	
	public function goBack():Void
	{
		SaveProfiles();
		FlxG.switchState(new MenuState());
	}
	
	public function SaveProfiles():Void
	{
		profileSaveData.flush(); // saved!
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
	}	
}