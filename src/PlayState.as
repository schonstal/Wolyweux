package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;

  public class PlayState extends FlxState
  {
    public static const STATES:Object = {
      TITLE: "title",
      EXPLAIN: "explain",
      PLAYING: "playing"
    }
    private var state:String;

    private var background:FlxSprite;
    private var vignette:FlxSprite;
    private var woly:WolyweuxGroup;
    private var greenPixel:FlxButton;
    private var cursor:FlxSprite;

    private var logo:LogoGroup;

    public function PlayState(state:String="title") {
      this.state = state;
    }

    override public function create():void {
      background = new FlxSprite();
      background.loadGraphic(Assets.Background);
      background.scrollFactor.y = 0.9;
      add(background);

      vignette = new FlxSprite();
      vignette.loadGraphic(Assets.Vignette);
      vignette.blend = "multiply";
      vignette.scrollFactor.x = vignette.scrollFactor.y = 0;
      add(vignette);

      FlxFlod.playMod(Assets.Woly);
//      add(new ThoughtGroup());

      if(state == STATES.TITLE) {
        logo = new LogoGroup(25,28);
        add(logo);
      }

      woly = new WolyweuxGroup();
      add(woly)

      greenPixel = new FlxButton(137, 166);
      greenPixel.makeGraphic(46,46,0xff35f14f);
      greenPixel.onUp = function():void { 
        if(state == STATES.TITLE) {
          logo.dismiss(function():void {
            add(new ThoughtGroup(["What do the taps do?"]));
          });
          state = STATES.EXPLAIN;
        }
      };
      add(greenPixel);

      cursor = new FlxSprite(0,0);
      cursor.makeGraphic(16,16,0xfff22311);
      add(cursor);
    }

    override public function update():void {
      cursor.x = FlxG.mouse.x;
      cursor.y = FlxG.mouse.y;

      super.update();
    }
  }
}
