package
{
  import org.flixel.*;

  public class Cursor extends FlxSprite
  {
    public function Cursor(graphic:Class=null) {
      super();
      if(graphic == null) graphic = Assets.Pointer;
      loadGraphic(graphic);
    }

    public override function update():void {
      x = FlxG.mouse.x;
      y = FlxG.mouse.y;
      super.update();
    }
  }
}
