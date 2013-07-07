package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class GameState extends FlxState
  {
    public const TRANSITION_COLOR:uint = 0xff33ff33;
    public const TWEEN_TIME:Number = 0.5;
    public const STATES:Object = {
      STARTING: "starting",
      PLAYING: "playing",
      RESULTS: "results"
    };

    protected var time:Number = 5;
    protected var timerText:FlxText;

    protected var music:Class = Assets.PowarThrust;
    protected var state:String = STATES.STARTING;

    private var transitionSquares:Object = {};

    override public function create():void {
//      FlxFlod.playMod(music);

      timerText = new FlxText(5,5,FlxG.width,"");
      timerText.font  = "04b03";
      timerText.color = 0xffffff;
      timerText.size  = 16;
      add(timerText);

      transitionSquares['left'] = new FlxSprite(0,0);
      transitionSquares['left'].makeGraphic(FlxG.width/2, FlxG.height, TRANSITION_COLOR);
      add(transitionSquares['left']);

      transitionSquares['up'] = new FlxSprite(0,0);
      transitionSquares['up'].makeGraphic(FlxG.width, FlxG.height/2, TRANSITION_COLOR);
      add(transitionSquares['up']);

      transitionSquares['right'] = new FlxSprite(FlxG.width/2, 0);
      transitionSquares['right'].makeGraphic(FlxG.width/2, FlxG.height, TRANSITION_COLOR);
      add(transitionSquares['right']);

      transitionSquares['down'] = new FlxSprite(0,FlxG.height/2);
      transitionSquares['down'].makeGraphic(FlxG.width, FlxG.height/2, TRANSITION_COLOR);
      add(transitionSquares['down']);
      
      var tweenPositions:Object = {
        left: [-FlxG.width/2, 0],
        up: [0, -FlxG.height/2],
        right: [FlxG.width, 0],
        down: [0, FlxG.height]
      };

      for (var key:String in tweenPositions) {
        TweenLite.to(transitionSquares[key], TWEEN_TIME, {
          x: tweenPositions[key][0],
          y: tweenPositions[key][1],
          ease: Quart.easeInOut,
          onComplete: function():void {
            state = STATES.PLAYING;
          }
        });
      }

      super.create();
    }

    override public function update():void {
      switch(state) {
        case STATES.PLAYING:
          time -= FlxG.elapsed;
          timerText.text = "" + Math.ceil(time);
          break;
      }
      super.update();
    }
  }
}

