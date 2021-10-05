
class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
}