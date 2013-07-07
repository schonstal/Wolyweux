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
    public static const GAMES:Array = [PhoneGame]

    public static const TEXT_TIME:Number = 4;
    private var state:String;

    private var background:FlxSprite;
    private var vignette:FlxSprite;
    private var woly:WolyweuxGroup;
    private var greenPixel:FlxButton;
    private var cursor:FlxSprite;
    private var thoughts:ThoughtGroup;
    private var scoreText:FlxText;

    private var logo:LogoGroup;

    public function PlayState(state:String="title") {
      this.state = state;
      if(state == STATES.TITLE) G.score = 0;
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

//      FlxFlod.playMod(Assets.Woly);
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
            thoughts = new ThoughtGroup(["Oh Green Pixel,", "what secrets do you keep?"]);
            add(thoughts);
            (new FlxTimer()).start(5, 1, function():void {
              thoughts.writeText(["Show me something,", "make me weep."]); 
              new FlxTimer().start(4, 1, function():void {
                thoughts.writeText(["..."],0.5);
                new FlxTimer().start(2.5, 1, function():void {
                  thoughts.writeText(["Eureka!"]);
                  new FlxTimer().start(3, 1, function():void {
                    playGame();
                    state = STATES.PLAYING;
                    scoreText.visible = true;
                  });
                });
              });
            });
          });
          state = STATES.EXPLAIN;
        }
      };
      add(greenPixel);

      scoreText = new FlxText(FlxG.width - 38, FlxG.height - 22, 32, "fdsfdas" + G.score);
      scoreText.font = "04b03";
      scoreText.color = 0xff000000;
      scoreText.size = 16;
      scoreText.alignment = "right";
      if(state == STATES.TITLE) {
        scoreText.visible = false;
      }
      add(scoreText);

      cursor = new FlxSprite(0,0);
      cursor.makeGraphic(16,16,0xfff22311);
      add(cursor);

      if(G.games.length == 0) G.games = GAMES;
    }

    override public function update():void {
      cursor.x = FlxG.mouse.x;
      cursor.y = FlxG.mouse.y;
      scoreText.text = '' + G.score;

      super.update();
    }

    private function playGame():void {
      var gameState:Class = G.games.shift();
      thoughts.writeText(gameState.DESCRIPTION);
      new FlxTimer().start(TEXT_TIME, 1, function():void {
        FlxG.switchState(new gameState());
      });
    }

    private function shuffleGames():void {
      G.games = GAMES;
    }
  }
}
