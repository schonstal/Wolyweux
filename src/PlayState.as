package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.FlxFlod;

  public class PlayState extends FlxState
  {
    override public function create():void {
//      FlxFlod.playMod(Assets.PowarThrust);
      add(new ThoughtGroup());
    }

    override public function update():void {
      if(FlxG.keys.UP) {
        FlxFlod.tempo++;
      }
      if(FlxG.keys.DOWN) {
        FlxFlod.tempo--;
      }
      if(FlxG.mouse.justPressed()) { FlxG.switchState(new GameState()); }
      super.update();
    }
  }
}
