package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ShakeTween;

class PlayState extends FlxState
{
	var text:FlxText;
	override public function create()
	{
		super.create();
		text = new FlxText(0,0,FlxG.width, "Hello World", 64);
		text.setFormat(null,64,FlxColor.RED,FlxTextAllign.CENTER);
		add(text);
		var spriteNoShake = new FlxSprite();
		add(spriteNoShake);
		spriteTest = new FlxSprite();
		add(spriteTest);
		FlxG.camera.zoom = 4;
		spriteNoShake.screenCenter();
		spriteNoShake.x -= 15;
		spriteTest.screenCenter();
		spriteTest.x += 15;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.watch.addQuick("Position", spriteTest.getPosition());
		FlxG.watch.addQuick("Offset", spriteTest.offset);

		if (FlxG.keys.justPressed.S)
			tweenTest = FlxTween.shake(spriteTest);

		if (FlxG.keys.justPressed.C && tweenTest != null)
			tweenTest.cancel();

		if (FlxG.keys.pressed.UP)
			spriteTest.y--;

		if (FlxG.keys.pressed.DOWN)
			spriteTest.y++;
	}
}
