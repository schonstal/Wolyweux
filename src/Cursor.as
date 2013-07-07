package
{
  import org.flixel.*;

  public class Cursor extends FlxSprite
  {
    public function Cursor() {
      super();
      loadGraphic(Assets.Pointer);
    }

    public override function update():void {
      x = FlxG.mouse.x;
      y = FlxG.mouse.y;
      super.update();
    }
  }
}
