package
{
  import org.flixel.*;

  public class ButtocksGame extends GameState
  {
    public static const DESCRIPTION:Array = ["The engine isn't finished.", "Her buttocks are wrong."];
    public static const WINNING_BUTT:Number = 0;
    public static const BUTT_GAP:Number = 30;
    public static const BUTT_Y:Number = 200;

    private var computerSprite:FlxSprite;

    private var cursor:Cursor;
    private var butts:Array = [0, 1, 2];
    private var buttOrder:Array = [];
    private var dialog:FlxSprite;

    override public function create():void {
      music = Assets.WolyButt;

      computerSprite = new FlxSprite();
      computerSprite.loadGraphic(Assets.Screen, false, false, 320); 
      add(computerSprite);

      var herButt:FlxSprite = new FlxSprite(64, 96);
      herButt.visible = false;

      buttOrder = ArrayHelper.shuffle(butts);
      buttOrder.forEach(function(buttNum:int, i:int, arr:Array) {
        var butt:FlxButton = new FlxButton(178, [34,92,150][i]);
        butt.loadGraphic([Assets.ButtRound, Assets.ButtPointy, Assets.ButtSquare][buttNum], true, false, 92, 56);
        butt.onDown = function():void {
          if(won) return;
          herButt.loadGraphic([Assets.ButtRound, Assets.ButtPointy, Assets.ButtSquare][buttNum], true, false, 92, 56);
          herButt.visible = true;
          cursor.visible = false;
          if(buttNum == WINNING_BUTT) {
            won = true;
            FlxG.play(Assets.CorrectButtSound, 0.7);
            new FlxTimer().start(0.5, 1, function():void {
              dialog.visible = true;
              dialog.play("win");
            });
          } else {
            FlxG.play(Assets.WrongButtSound, 0.7);
            new FlxTimer().start(0.5, 1, function():void {
              dialog.visible = true;
              dialog.play("lose");
            });
          }

        };
        add(butt);
      });

      add(herButt);

      dialog = new FlxSprite(34,72);
      dialog.loadGraphic(Assets.Dialog, true, false, 252, 96);
      dialog.addAnimation("win", [2,0], 4);
      dialog.addAnimation("lose",[1,0], 4);
      dialog.visible = false;
      add(dialog);

      cursor = new Cursor();
      add(cursor);

      super.create();

      timerText.color = 0xff000000;
    }

    override public function update():void {
      super.update();
    }
  }
}
