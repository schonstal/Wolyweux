package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;

  public class PlayState extends FlxState
  {

    override public function create():void {
      FlxFlod.playMod(Assets.PowarThrust);
    }

    override public function update():void {
      if(FlxG.keys.UP) {
        FlxFlod.tempo++;
      }
      if(FlxG.keys.DOWN) {
        FlxFlod.tempo--;
      }
      super.update();
    }
  }
}
