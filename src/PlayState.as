package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;

  public class PlayState extends FlxState
  {
    private var wolyweux:FlxSprite;
    private var wolyweuxGlow:FlxSprite;
    private var shadow:FlxSprite;
    private var background:FlxSprite;
    private var vignette:FlxSprite;

    private var logo:FlxGroup;

    override public function create():void {
      background = new FlxSprite();
      background.loadGraphic(Assets.Background);
      add(background);

      vignette = new FlxSprite();
      vignette.loadGraphic(Assets.Vignette);
      vignette.blend = "multiply";
      add(vignette);
//      FlxFlod.playMod(Assets.PowarThrust);
//      add(new ThoughtGroup());
      logo = new LogoGroup();
      add(logo);

      wolyweux = new FlxSprite(112,95);
      wolyweux.loadGraphic(Assets.Wolyweux);
      add(wolyweux);

      wolyweuxGlow = new FlxSprite(131,130);
      wolyweuxGlow.loadGraphic(Assets.WolyweuxGlow);
      wolyweuxGlow.blend = "screen";
      wolyweuxGlow.alpha = 32.5;
      add(wolyweuxGlow);

      shadow = new FlxSprite(124,218);
      shadow.loadGraphic(Assets.Shadow);
      add(shadow);
    }

    override public function update():void {
      if(FlxG.mouse.justPressed()) { FlxG.switchState(new GameState()); }
      super.update();
    }
  }
}
