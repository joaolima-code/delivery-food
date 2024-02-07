import 'package:connectivity_plus/connectivity_plus.dart';

mixin CoreNetworkConnectionInterface {
  Future<bool> checkConnectivity();
}

class CoreNetworkConnection implements CoreNetworkConnectionInterface {
  CoreNetworkConnection();

  @override
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connection =
        await Connectivity().checkConnectivity();

    final bool isConnected = connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi;

    return isConnected;
  }
}
