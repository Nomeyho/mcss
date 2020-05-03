import 'package:dart_mc_ping/dart_mc_ping.dart' as Minecraft;
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:logging/logging.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

class McServerService {
  final Logger log = Logger('MCSS.ServerService');
  final String serverListKey = 'MCSS_SERVER_LIST';

  Future<List<McServer>> loadServers() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final strings = sharedPreferences.getStringList(serverListKey) ?? [];
      final servers = strings.map((s) => McServer.parse(s)).toList(growable: false);
      log.fine('Loaded servers: $servers');
      return servers;
    } catch (e) {
      log.severe('Could not load server list: $e');
      return [];
    }
  }

  Future<void> saveServers(List<McServer> servers) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final value = servers.map((s) => s.toString()).toList(growable: false);
      sharedPreferences.setStringList(serverListKey, value);
      log.fine('Saved servers: $servers');
    } catch (e) {
      log.fine('Failed to save servers: $e');
    }
  }

  Future<void> deleteServers() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(serverListKey);
      log.fine('Deleted servers');
    } catch (e) {
      log.fine('Failed to delete servers: $e');
    }
  }

  Future<StatusResponse> ping(McServer server) async {
    try {
      final statusResponse = await Minecraft.ping(
        server.hostname,
        port: server.port,
      );
      log.fine('Ping $server: ${statusResponse.ms} ms');
      return statusResponse;
    } catch (e) {
      log.severe('Failed to ping $server: $e');
      throw e;
    }
  }
}
