package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class GameState extends FlxState
  {
    public static const TRANSITION_COLOR:uint = 0xff35f14f;
    public static const TWEEN_TIME:Number = 0.5;
    public static const STATES:Object = {
      STARTING: "starting",
      PLAYING: "playing",
      LOST: "lost",
      WON: "won",
      LEAVING: "leaving"
    };

    public static const DESCRIPTION:Array = ["You forgot to add", "a description"];

    protected var time:Number = 5;
    protected var timerText:FlxText;

    protected var music:Class = Assets.Woly;
    protected var state:String = STATES.STARTING;

    private var transitionSquares:Object = {};

    override public function create():void {
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
        up: [0, -FlxG.width/2],
        right: [FlxG.width, 0],
        down: [0, FlxG.width]
      };

      for (var key:String in tweenPositions) {
        TweenLite.to(transitionSquares[key], TWEEN_TIME/FlxG.timeScale, {
          x: tweenPositions[key][0],
          y: tweenPositions[key][1],
          ease: Quart.easeInOut,
          onComplete: function():void {
            state = STATES.PLAYING;
            MusicPlayer.play(music);
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
          if(time <= 0) {
            lose();
          }
          break;
        case STATES.LOST:
        case STATES.WON:
          var tweenPositions:Object = {
            left: [0, 0],
            up: [0, 0],
            right: [FlxG.width/2, 0],
            down: [0, FlxG.height/2]
          };

          for (var key:String in tweenPositions) {
            TweenLite.to(transitionSquares[key], TWEEN_TIME/FlxG.timeScale, {
              x: tweenPositions[key][0],
              y: tweenPositions[key][1],
              ease: Quart.easeInOut,
              onComplete: function():void {
                FlxG.switchState(new PlayState(PlayState.STATES.PLAYING));
              }
            });
          }

          state = STATES.LEAVING;
          break;
      }
      super.update();
    }

    protected function win():void {
      //Mark game as won
      state = STATES.WON;
    }

    protected function lose():void {
      state = STATES.LOST;
    }
  }
}

