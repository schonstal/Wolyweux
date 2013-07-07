package
{
  import org.flixel.*;

  public class ThoughtGroup extends FlxGroup
  {
    private var thought:FlxText;

    private var firstBubble:FlxSprite;
    private var secondBubble:FlxSprite;
    private var bigBubbles:Array;
    private var box:FlxSprite;

    public function ThoughtGroup() {
      firstBubble = new BubbleSprite(106, 93, 5);
      add(firstBubble);

      secondBubble = new BubbleSprite(70, 68, 4);
      add(secondBubble);

      bigBubbles = [[26, -25, 2],
            [25, -4, 2],
            [33, 29, 3],
            [44, 18, 2],
            [72, 6, 1],
            [99, -9, 0],
            [147, 21, 2],
            [166, 0, 1],
            [196, -10, 0],
            [237, 16, 2],
            [266, 27, 3],
            [252, -9, 2]];

      bigBubbles = bigBubbles.map(function(element:Array, index:int, arr:Array):BubbleSprite {
        var bs:BubbleSprite = new BubbleSprite(element[0], element[1], element[2]);
        add(bs);
        return bs;
      });

      box = new FlxSprite(30,0);
      box.makeGraphic(200,20,0xffffffff);
      add(box);
      
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
