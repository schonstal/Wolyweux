package
{
    import org.flixel.*;

    public class G
    {
        public var _api:KongApi;        

        private static var _instance:G = null;

        public function G() {
        }

        private static function get instance():G {
            if(_instance == null) {
                _instance = new G();
            }

            return _instance;
        }

        public static function get api():KongApi {
          return instance._api;
        }

        public static function set api(value:KongApi):void {
          instance._api = value;
        }
    }
}
