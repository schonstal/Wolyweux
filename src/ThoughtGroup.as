package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class ThoughtGroup extends FlxGroup
  {
    public static const TWEEN_TIME:Number = 0.125;
    public static const TWEEN_UP_AMT:Number = 10;
    public static const LETTER_TIME:Number = 0.05;

    private var thought:FlxText;

    private var firstBubble:FlxSprite;
    private var secondBubble:FlxSprite;
    private var bigBubbles:Array;
    private var box:FlxSprite;

    private var text:Array;
    private var textHeight:Array = [15, 8, 2];
    private var characterIndex:Number = 0;
    private var textIndex:Number = 10;
    private var textTimer:Number = 0;

    public function ThoughtGroup(text:Array) {
      this.text = text;
      firstBubble = new BubbleSprite(106, 93 + TWEEN_UP_AMT, 5);
      firstBubble.alpha = 0;
      add(firstBubble);

      secondBubble = new BubbleSprite(70, 68 + TWEEN_UP_AMT, 4);
      secondBubble.alpha = 0;
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
        var bs:BubbleSprite = new BubbleSprite(element[0], element[1] + TWEEN_UP_AMT, element[2]);
        bs.alpha = 0;
        add(bs);
        return bs;
      });

      box = new FlxSprite(30,TWEEN_UP_AMT);
      box.makeGraphic(230,30,0xffffffff);
      box.alpha = 0;
      bigBubbles.push(box);
      add(box);
      
      thought = new FlxText(40,2,230,"");
      thought.alignment = "center";
      thought.font = "04b03";
      thought.size = 16;
      thought.color = 0xff000000;
      add(thought);

      setupBubbles();
    }

    private function setupBubbles():void {
      TweenLite.to(firstBubble, TWEEN_TIME/FlxG.timeScale, {
        alpha: 1,
        y: firstBubble.y - TWEEN_UP_AMT,
        ease: Quart.easeInOut,
        onComplete: function():void {
          TweenLite.to(secondBubble, TWEEN_TIME/FlxG.timeScale, {
            alpha: 1,
            y: secondBubble.y - TWEEN_UP_AMT,
            ease: Quart.easeInOut,
            onComplete: function():void {
              for(var i:int=0; i < bigBubbles.length; i++) {
                TweenLite.to(bigBubbles[i], TWEEN_TIME/FlxG.timeScale, {
                  alpha: 1,
                  y: bigBubbles[i].y - TWEEN_UP_AMT,
                  ease: Quart.easeInOut,
                  onComplete: function():void {
                    writeText();
                  }
                });
              }
            }
          });
        }
      });
    }

    private function writeText():void {
      thought.y = textHeight[text.length-1];
      textIndex = 0;
    }

    public override function update():void {
      if(textIndex < text.length) {
        textTimer += FlxG.elapsed;
        if(textTimer >= LETTER_TIME) {
          thought.text += text[textIndex].charAt(characterIndex);
          characterIndex++;
          if(characterIndex >= text[textIndex].length) {
            characterIndex = 0;
            textIndex++;
            thought.text += "\n";
          }
          textTimer = 0;
        }
      }
      super.update();
    }
  }
}
