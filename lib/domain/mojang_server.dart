
import 'package:mcss/domain/mojang_server_status.dart';

class MojangServer {

  final String name;
  final String url;
  final MojangServerStatus status;

  MojangServer({ this.name, this.url, this.status });

  @override
  String toString() {
    return '$name ($url) - $status';
  }
}
