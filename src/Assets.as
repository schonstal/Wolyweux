package
{
  import org.flixel.*;

  public class Assets
  {
    [Embed(source = "../data/logo.png")] public static var Splash:Class;
    [Embed(source = "../data/bading.mp3")] public static var BaDing:Class;

    [Embed(source = "../data/powar_thrust.mod", mimeType="application/octet-stream")] public static var PowarThrust:Class;


    [Embed(source = '../data/04b03.ttf', fontFamily="04b03", embedAsCFF="false")] public var ZeroFour:String;
  }
}
