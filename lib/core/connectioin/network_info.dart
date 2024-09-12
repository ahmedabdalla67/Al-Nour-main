import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImp extends NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImp(this.connectionChecker);

  @override
  Future<bool>? get isConnected => connectionChecker.hasConnection;
}
