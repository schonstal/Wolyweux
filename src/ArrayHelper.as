package
{
  public class ArrayHelper {
    public static function shuffle(arr:Array):Array {
      var arr2:Array = [];
      while (arr.length > 0) {
        arr2.push(arr.splice(Math.round(Math.random() * (arr.length - 1)), 1)[0]);
      }
      return arr2;
    }
  }
}
