import 'package:dart_mc_ping/model/status_response.dart';
import 'package:logging/logging.dart';
import 'package:mcss/domain/server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_mc_ping/dart_mc_ping.dart' as Minecraft;

class ServerService {
  final Logger log = Logger('ServerService');
  final String serverListKey = 'MCSS_SERVER_LIST';

  Future<List<Server>> loadServers() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final strings = sharedPreferences.getStringList(serverListKey);

    try {
      final servers = strings.map((s) => Server.parse(s)).toList();
      log.fine('Loaded servers: $servers');
      return servers;
    } catch (e) {
      log.severe('Could not load server list', e);
      log.severe(strings);
      return [];
    }
  }

  Future<void> saveServers(List<Server> servers) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = servers.map((s) => s.toString()).toList(growable: false);
    sharedPreferences.setStringList(serverListKey, value);
  }

  Future<StatusResponse> ping(Server server) async {
    final statusResponse = await Minecraft.ping(
      server.hostname,
      port: server.port,
    );
    // TODO error handling
    log.fine('Ping $server: $statusResponse');
  }
}
