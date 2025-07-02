import 'package:gebeya/common/network/network_client.dart';
import 'package:gebeya/configs/data_configs.dart';

class Provider {
  static NetworkClient networkClient() {
    return NetworkClient(apiHost, isSSL: true);
  }
}
