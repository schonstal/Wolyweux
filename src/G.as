package
{
    import org.flixel.*;

    public class G
    {
        public var _api:KongApi;        
        public var _score:int;
        public var _games:Array;

        private static var _instance:G = null;

        public function G() {
        }

        private static function get instance():G {
            if(_instance == null) {
                _instance = new G();
                _instance._games = [];
            }

            return _instance;
        }

        public static function get api():KongApi {
          return instance._api;
        }

        public static function set api(value:KongApi):void {
          instance._api = value;
        }

        public static function get score():int {
          return instance._score;
        }

        public static function set score(value:int):void {
          instance._score = value;
        }

        public static function get games():Array {
          return instance._games;
        }

        public static function set games(value:Array):void {
          instance._games = value;
        }
    }
}
