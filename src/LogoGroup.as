package
{
  import org.flixel.*;
  import flash.geom.Point;
  import flash.geom.Rectangle;

  public class LogoGroup extends FlxGroup
  {
    public static const OFFSETS:Array = [0,41,73,101,134,177,204,236,269];

    private var logo:FlxSprite;
    private var letters:Array = [];
    private var zero:Point = new Point(0,0);


    public function LogoGroup(X:Number=0,Y:Number=0) {
      super();
      logo = new FlxSprite();
      logo.loadGraphic(Assets.Logo, false, false, 73-41);

      var s:FlxSprite;

      for (var i:int=0; i < OFFSETS.length-1; i++) {
        s = new FlxSprite(X + OFFSETS[i], Y);
        s.makeGraphic(OFFSETS[i+1] - OFFSETS[i], 39, 0);
        s.framePixels.copyPixels(logo.framePixels, new Rectangle(0,OFFSETS[i],OFFSETS[i+1] - OFFSETS[i],39), zero);
        letters.push(s);
        add(s);
      }
    }

    override public function update():void {
      super.update();
    }
  }
}
