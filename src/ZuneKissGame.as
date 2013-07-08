package
{
  import org.flixel.*;

  public class ZuneKissGame extends GameState
  {
    public static const DESCRIPTION:Array = ["I already have an almost", "physical love for Microsoft"];

    private var zuneSprite:FlxSprite;

    private var cursor:Cursor;
    private var lipstick:FlxSprite;

    override public function create():void {
      music = Assets.WolyZune;

      zuneSprite = new FlxSprite();
      zuneSprite.loadGraphic(Assets.Journal, true, true, 320); 
      add(zuneSprite);

      lipstick = new FlxSprite();
      lipstick.loadGraphic(Assets.Lipstick);

      cursor = new Cursor();
      cursor.loadGraphic(Assets.Lips, true, false, 74, 50);
      add(cursor);

      super.create();
      MusicPlayer.setVolume(0.7);
      timerText.color = 0xff000000;
    }

    override public function update():void {
      if(FlxG.mouse.justPressed() && playing) {
        cursor.frame = 1;
        zuneSprite.stamp(lipstick, cursor.x, cursor.y);
        FlxG.play(Assets.KissSound, 0.4);
        won = true;
      }
      if(FlxG.mouse.justReleased()) {
        cursor.frame = 0;
      }
      super.update();
    }
  }
}
