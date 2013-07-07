package
{
  import org.flixel.*;

  public class PhoneGame extends GameState
  {
    public static const DESCRIPTION:Array = ["If this crashes the plane,", "me turning my phone on,", "so be it."];

    override public function create():void {
      add(new FlxSprite(100,100));
      music = Assets.WolyDerp1;
      super.create();
    }
  }
}
