import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  final String _baseUrl = 'BASE_URL';

  static NetworkManager? _instance;
  late final Dio dio;

  static NetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = NetworkManager._init();

    return _instance!;
  }

  NetworkManager._init() {
    final url = dotenv.env[_baseUrl];
    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        //options.path += 't=\$batman';
        handler.next(options);
      }));
      dio.interceptors.add(PrettyDioLogger());
    } else {
      //print("enviroment not found!");
    }
  }
}
