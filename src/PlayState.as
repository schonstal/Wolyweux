package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class PlayState extends FlxState
  {
    public static const STATES:Object = {
      TITLE: "title",
      EXPLAIN: "explain",
      PLAYING: "playing"
    }
    public static const GAMES:Array = [PhoneGame]

    public static const PAN_TIME:Number = 0.75;
    public static const TEXT_TIME:Number = 5;

    private var state:String;

    private var background:FlxSprite;
    private var vignette:FlxSprite;
    private var woly:WolyweuxGroup;
    private var greenPixel:FlxButton;
    private var pixelGlow:FlxSprite;
    private var cursor:FlxSprite;
    private var thoughts:ThoughtGroup;
    private var scoreText:FlxText;

    private var glowSin:Number = 0;

    private var logo:LogoGroup;

    public function PlayState(state:String="playing") {
      this.state = state;
      if(state == STATES.TITLE) G.score = 0;
    }

    override public function create():void {
      background = new FlxSprite();
      background.loadGraphic(Assets.Background);
      background.scrollFactor.y = 0.75;
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
          pixelGlow.visible = false;
          cursor.visible = false;
          logo.dismiss(function():void {
            thoughts = new ThoughtGroup(["Oh Green Pixel,", "what secrets do you keep?"]);
            add(thoughts);
            (new FlxTimer()).start(5, 1, function():void {
              thoughts.writeText(["Show me something,", "make me weep."]); 
              new FlxTimer().start(3.5, 1, function():void {
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
      greenPixel.onOver = function():void {
        if(state == STATES.TITLE) {
          pixelGlow.visible = true;
        }
      };
      greenPixel.onOut = function():void {
        pixelGlow.visible = false;
      };

      add(greenPixel);

      pixelGlow = new FlxSprite(105, 134);
      pixelGlow.blend = "add";
      pixelGlow.alpha = 0.8;
      pixelGlow.loadGraphic(Assets.PixelGlow);
      pixelGlow.visible = false;
      add(pixelGlow);

      scoreText = new FlxText(FlxG.width - 38, FlxG.height - 22, 32, "fdsfdas" + G.score);
      scoreText.scrollFactor.y = 0;
      scoreText.font = "04b03";
      scoreText.color = 0xff000000;
      scoreText.size = 16;
      scoreText.alignment = "right";
      if(state == STATES.TITLE) {
        scoreText.visible = false;
      }
      add(scoreText);

      cursor = new FlxSprite(0,0);
      cursor.loadGraphic(Assets.Pointer);
      add(cursor);

      if(G.games.length == 0) G.games = GAMES.concat();

      if(state == STATES.PLAYING) {
        FlxG.camera.scroll.y = greenPixel.y - (FlxG.height/2 - greenPixel.height/2);
        greenPixel.scale.x = greenPixel.scale.y = FlxG.width/greenPixel.width;
        TweenLite.to(greenPixel.scale, GameState.TWEEN_TIME/FlxG.timeScale, {
          x: 1,
          y: 1,
          ease: Quart.easeInOut,
          onComplete: function():void {
            TweenLite.to(FlxG.camera.scroll, PAN_TIME/FlxG.timeScale, {
              y: 0,
              ease: Quad.easeInOut,
              onComplete: function():void {
                playGame();
              }
            });
          }
        });
        cursor.visible = false;
      }

    }

    override public function update():void {
      glowSin += (FlxG.elapsed/1) * 2 * Math.PI;
      pixelGlow.alpha = Math.sin(glowSin) * 0.2 + 0.8;

      cursor.x = FlxG.mouse.x;
      cursor.y = FlxG.mouse.y;
      scoreText.text = '' + G.score;

      super.update();
    }

    private function playGame():void {
      var gameState:Class = G.games.shift();

      if(thoughts == null) {
        thoughts = new ThoughtGroup(gameState.DESCRIPTION);
        add(thoughts);
      } else {
        thoughts.writeText(gameState.DESCRIPTION);
      }

      new FlxTimer().start(TEXT_TIME, 1, function():void {
        thoughts.dismiss(function():void {
          TweenLite.to(FlxG.camera.scroll, PAN_TIME/FlxG.timeScale, {
            y: greenPixel.y - (FlxG.height/2 - greenPixel.height/2),
            ease: Quad.easeInOut,
            onComplete: function():void {
              TweenLite.to(greenPixel.scale, GameState.TWEEN_TIME/FlxG.timeScale, {
                x: FlxG.width/greenPixel.width,
                y: FlxG.width/greenPixel.width,
                ease: Quart.easeInOut,
                onComplete: function():void {
                  FlxG.switchState(new gameState());
                }
              });
            }
          });
        });
      });
    }

    private function shuffleGames():void {
      G.games = GAMES;
    }
  }
}
