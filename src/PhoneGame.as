package
{
  import org.flixel.*;

  public class PhoneGame extends GameState
  {
    public static const DESCRIPTION:Array = ["If this crashes the plane,", "me turning my phone on,", "so be it."];

    private var phoneSprite:FlxSprite;
    private var cursor:Cursor;

    override public function create():void {
      music = Assets.WolyDerp1;

      phoneSprite = new FlxSprite();
      phoneSprite.loadGraphic(Assets.CellPhone, true, false, 320); 
      phoneSprite.addAnimation("idle", [0]);
      phoneSprite.addAnimation("win", [1]);
      add(phoneSprite);

      cursor = new Cursor();
      add(cursor);

      super.create();
    }

    override public function update():void {
      if(FlxG.mouse.justPressed()) {
        cursor.visible = false;
        phoneSprite.play("win");
        won = true;
      }
      super.update();
    }
  }
}
