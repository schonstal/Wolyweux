package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;

  public class PlayState extends FlxState
  {
    private var background:FlxSprite;
    private var vignette:FlxSprite;
    private var woly:WolyweuxGroup;
    private var greenPixel:FlxSprite;

    private var logo:FlxGroup;

    override public function create():void {
      background = new FlxSprite();
      background.loadGraphic(Assets.Background);
      add(background);

      vignette = new FlxSprite();
      vignette.loadGraphic(Assets.Vignette);
      vignette.blend = "multiply";
      add(vignette);
      FlxFlod.playMod(Assets.PowarThrust);
//      add(new ThoughtGroup());
      logo = new LogoGroup();
      add(logo);

      woly = new WolyweuxGroup();
      add(woly)

      greenPixel = new FlxSprite(137, 166);
      greenPixel.makeGraphic(46,46,0xff35f14f);
      add(greenPixel);
    }

    override public function update():void {
      if(FlxG.mouse.justPressed()) { FlxG.switchState(new GameState()); }
      super.update();
    }
  }
}
