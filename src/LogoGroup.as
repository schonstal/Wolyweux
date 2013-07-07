package
{
  import org.flixel.*;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class LogoGroup extends FlxGroup
  {
    public static const OFFSETS:Array = [0,41,73,101,134,177,204,236,269];
    public static const SIN_FREQ:Number = 1;
    public static const SIN_OFFSET:Number = 1;
    public static const OSC_AMT:Number = 5;
    public static const TWEEN_TIME:Number = 0.033;

    private var logo:FlxSprite;
    private var letters:Array = [];
    private var sinAmt:Number = 0;
    private var alphaTimer:Number = 0;


    public function LogoGroup(X:Number=0,Y:Number=0) {
      super();
      for(var i:int = 0; i < 8; i++) {
        logo = new FlxSprite(X+OFFSETS[i],Y);
        logo.loadGraphic(Assets.Logo, false, false, 41);
        logo.frame = i;
        letters.push(logo);
        add(logo);
      }
    }

    override public function update():void {
      sinAmt -= Math.PI * 2 * FlxG.elapsed/SIN_FREQ;
      var i:Number;

      for(i = 0; i < 8; i++) {
        var sin:Number = Math.sin(sinAmt + (i * SIN_OFFSET));
        letters[i].offset.y =  sin * OSC_AMT;
      }
      super.update();
    }

    public function dismiss(callback:Function=null):void {
      var i:Number;
      var options:Object = {};

      for(i = 0; i < 8; i++) {
        options = {
          alpha: 0,
          ease: Quart.easeIn
        };
        if(i == 7) options.onComplete = callback;

        TweenLite.to(letters[i], (TWEEN_TIME + (i * 0.1))/FlxG.timeScale, options);

      }
    }

  }
}
