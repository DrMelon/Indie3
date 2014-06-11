package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * The main menu, which leads into various other menus, like the profiles menu or pregame
 */
class MenuState extends FlxState
{
	/**
	 * Buttons! O:
	 */
	
	 var pregameMenuButton:FlxButton;
	 var profilesMenuButton:FlxButton;
	 var optionsMenuButton:FlxButton;
	
	

	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	override public function create():Void
	{
		super.create();
		
		pregameMenuButton = new FlxButton( 16, 0, "Play", switchToPregame);
		profilesMenuButton = new FlxButton( 16, 32, "Player Profiles", switchToProfiles);
		optionsMenuButton = new FlxButton( 16, 64, "Options");
		
		
		add(pregameMenuButton);
		add(profilesMenuButton);
		add(optionsMenuButton);
		
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
	
	
	/**
	 * Button functions.
	 */
	public function switchToPregame():Void
	{
		FlxG.switchState(new PregameState());
	}
	
	public function switchToProfiles():Void
	{
		FlxG.switchState(new ProfileState());
	}	
}