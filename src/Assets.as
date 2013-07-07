package
{
  import org.flixel.*;

  public class Assets
  {
    [Embed(source = "../data/logo.png")] public static var Splash:Class;
    [Embed(source = "../data/bading.mp3")] public static var BaDing:Class;

    [Embed(source = "../data/woly.mod", mimeType="application/octet-stream")] public static var Woly:Class;

    [Embed(source = '../data/04b03.ttf', fontFamily="04b03", embedAsCFF="false")] public var ZeroFour:String;


    [Embed(source = "../data/wolyweux.png")] public static var Wolyweux:Class;
    [Embed(source = "../data/wolyweuxGlow.png")] public static var WolyweuxGlow:Class;
    [Embed(source = "../data/shadow.png")] public static var Shadow:Class;
    [Embed(source = "../data/logo.png")] public static var Logo:Class;
    [Embed(source = "../data/background.png")] public static var Background:Class;
    [Embed(source = "../data/vignette.png")] public static var Vignette:Class;
    [Embed(source = "../data/pointer.png")] public static var Pointer:Class;
    [Embed(source = "../data/thoughtBubbles.png")] public static var ThoughtBubbles:Class;
  }
}
