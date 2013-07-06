package
{
  import org.flixel.*;

  [SWF(width="640", height="480", backgroundColor="#000000")]
  [Frame(factoryClass="Preloader")]

  public class MolyGame extends FlxGame
  {
    public function MolyGame() {
      super(176,136,BadingState,4);
//      forceDebugger = true;
//      FlxG.debug = true;
//      FlxG.visualDebug = true;
    }
  }
}
