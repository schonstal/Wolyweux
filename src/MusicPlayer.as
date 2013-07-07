package
{
  import org.flixel.*;

  public class MusicPlayer
  {
    import neoart.flod.core.CorePlayer;
    import neoart.flod.FileLoader;
    import flash.utils.ByteArray;

    public static var
    player  : CorePlayer,
    stream  : ByteArray,
    playing : Boolean,
    bpm     : int;

    public static function play(Source:Class, loopSong:Boolean = false):void {
      var loader:FileLoader = new FileLoader();
      stream = new Source as ByteArray;

      if (playing == true) player.stop();
      player = loader.load(stream);
      player.loopSong = (loopSong ? 1 : 0);
      player.tempo = player.tempo * FlxG.timeScale;
      player.play();

      playing = true;
    }

     public static function stop():void {
       player.stop();
       playing = false;
    }
  }
}
