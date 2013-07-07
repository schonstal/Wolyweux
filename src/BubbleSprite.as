package
{
  import org.flixel.*;

  public class BubbleSprite extends FlxSprite
  {
    public static const PERIOD:Number = 2;
    public static const AMPLITUDE:Number = 2;

    public var sinAmt:Number = 0; 

    public function BubbleSprite(X:Number, Y:Number, frame:uint) {
      super(X,Y);
      loadGraphic(Assets.ThoughtBubbles, true, false, 73, 73);
      this.frame = frame;

      sinAmt = 2*Math.PI * Math.random();
    }

    public override function update():void {
      sinAmt += 2 * Math.PI * FlxG.elapsed/PERIOD;
      var sin:Number = Math.sin(sinAmt);
      var cos:Number = Math.cos(sinAmt);

      offset.x = sin * AMPLITUDE;
      offset.y = cos * AMPLITUDE;
      super.update();
    }
  }
}
