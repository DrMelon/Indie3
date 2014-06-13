package;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;

/**
 * The pregame state is just a timer counting down until the game begins, all stylish like
 */
class PregameState extends FlxState
{
	
	var timeText:FlxText;
	var timeTextBorder:FlxText;
	var beam:FlxSprite;
	var curCount:Int;
	
	override public function create():Void
	{
		super.create();
		timeText = new FlxText(FlxG.width / 2 - 8, FlxG.height / 2 - 64, 0, "3", 16);
		timeTextBorder = new FlxText(FlxG.width / 2 - 8, FlxG.height / 2 - 64, 0, "3", 16);
		timeTextBorder.scale.x = 1.5;
		timeTextBorder.scale.y = 1.5;
		timeText.color = FlxColor.CHARCOAL;
		beam = new FlxSprite(FlxG.width / 2 - 32, 0);
		beam.makeGraphic(64, FlxG.height, FlxColorUtil.brighten(FlxColor.GOLDEN, 0.2));
		
		curCount = 3;
		
		add(beam);
		add(timeTextBorder);
		add(timeText);
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
		beam.scale.x -= FlxG.elapsed;
		if (beam.scale.x <= 0)
		{
			curCount--;
			beam.scale.x = 1.0;
		}
		
		timeTextBorder.text = "" + curCount;
		timeText.text = "" + curCount;
		
		if (curCount <= 0)
		{
			StartGame();
		}
	}	
}