import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static Future<List<ConnectivityResult>> networkCalls() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult;
  }
}
