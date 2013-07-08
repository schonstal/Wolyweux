package
{
  import org.flixel.*;

  public class PhoneGame extends GameState
  {
    public static const DESCRIPTION:Array = ["If this crashes the plane,", "me turning my phone on,", "so be it."];

    private var phoneSprite:FlxSprite;
    private var plane:FlxSprite;
    private var sky:FlxSprite;

    private var cursor:Cursor;

    override public function create():void {
      music = Assets.WolyDerp1;

      phoneSprite = new FlxSprite();
      phoneSprite.loadGraphic(Assets.CellPhone, true, false, 320); 
      phoneSprite.addAnimation("idle", [0]);
      phoneSprite.addAnimation("win", [1]);
      add(phoneSprite);

      plane = new FlxSprite(34, 42);
      plane.loadGraphic(Assets.Plane);

      sky = new FlxSprite();
      sky.velocity.x = -100;
      sky.loadGraphic(Assets.Sky)

      cursor = new Cursor();
      add(cursor);

      super.create();
    }

    override public function update():void {
      if(FlxG.mouse.justPressed() && playing) {
        if(!won) {
          FlxG.play(Assets.ButtonSound);
        }
        cursor.visible = false;
        phoneSprite.play("win");
        won = true;
        new FlxTimer().start(0.35,1,function():void {
          add(sky);
          add(plane);
          new FlxTimer().start(0.25,1,function():void {
            plane.angle = 20;
            plane.velocity.y = 250;
          });
        });
      }
      super.update();
    }
  }
}
