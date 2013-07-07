package
{
  import org.flixel.*;

  public class WolyweuxGroup extends FlxGroup
  {
    public static const SIN_RATE:Number = 0.75;

    private var wolyweux:FlxSprite;
    private var wolyweuxGlow:FlxSprite;
    private var shadow:FlxSprite;

    private var sinAmt:Number = 0;

    public function WolyweuxGroup() {
      shadow = new FlxSprite(124,218);
      shadow.loadGraphic(Assets.Shadow);
      add(shadow);

      wolyweux = new FlxSprite(96,83);
      wolyweux.loadGraphic(Assets.Wolyweux);
      add(wolyweux);

      wolyweuxGlow = new FlxSprite(131,130);
      wolyweuxGlow.loadGraphic(Assets.WolyweuxGlow);
      wolyweuxGlow.blend = "screen";
      wolyweuxGlow.alpha = 32.5;
      add(wolyweuxGlow);
    }

    override public function update():void {
      sinAmt += FlxG.elapsed / SIN_RATE;
      var sin:Number = Math.sin(sinAmt);
      wolyweuxGlow.offset.y = wolyweux.offset.y = Math.floor(sin * 5);
      wolyweuxGlow.alpha = 0.325 - (sin * 0.1);
      shadow.alpha = 0.875 - (sin * 0.125);

      super.update();
    }
  }
}
