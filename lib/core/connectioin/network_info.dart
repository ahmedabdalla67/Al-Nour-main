import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImp extends NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoImp(this.connectionChecker);

  @override
  Future<bool>? get isConnected => connectionChecker.hasInternetAccess;
}
