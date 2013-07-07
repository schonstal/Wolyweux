package
{
  import org.flixel.*;

  public class BubbleSprite extends FlxSprite
  {
    public function BubbleSprite(X:Number, Y:Number, frame:uint) {
      super(X,Y);
      loadGraphic(Assets.ThoughtBubbles, true, false, 73, 73);
      this.frame = frame;
    }
  }
}
