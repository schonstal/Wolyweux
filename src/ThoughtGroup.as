package
{
  import org.flixel.*;

  public class ThoughtGroup extends FlxGroup
  {
    private var thought:FlxText;

    public function ThoughtGroup() {
      thought = new FlxText(0,0,FlxG.width,"");
      thought.font = "04b03";
      thought.size = 8;
      add(thought);
    }

    override public function update():void {
      super.update();
    }
  }
}
