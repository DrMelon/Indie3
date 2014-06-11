package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * The pregame state lets you pick the map, and profiles of who will be playing. A lobby of sorts!
 */
class PregameState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		// Currently just button to test 1 player
		var justGo:FlxButton = new FlxButton(0, 0, "TEST DEBUG YES", StartGame);
		add(justGo);
	}
	
	public function StartGame():Void
	{
		FlxG.switchState(new PlayState());
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