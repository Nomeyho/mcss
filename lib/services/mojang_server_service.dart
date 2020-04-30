import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:mcss/domain/mojang_server.dart';
import 'package:mcss/domain/mojang_server_status.dart';

class MojangServerService {
  final Logger log = Logger('MCSS.MojangService');
  static const String url = 'https://status.mojang.com/check';

  Future<List<MojangServer>> loadServers() async {
    try {
      final Stopwatch stopwatch = Stopwatch();
      stopwatch.start();

      final response = await http.get(url);
      log.finer(
          'GET $url return with status ${response.statusCode} in (${stopwatch.elapsedMilliseconds}ms)');

      return _parse(response.body);
    } catch (e) {
      log.severe('Failed to retrieve servers status: $e');
      return [];
    }
  }

  List<MojangServer> _parse(String body) {
    final servers = json.decode(body) as List;

    return [
      MojangServer(
        name: 'Minecraft',
        url: 'minecraft.net',
        status: statusFromString(servers[0]['minecraft.net']),
      ),
      MojangServer(
        name: 'Session server',
        url: 'session.minecraft.net',
        status: statusFromString(servers[1]['session.minecraft.net']),
      ),
      MojangServer(
        name: 'Account server',
        url: 'account.mojang.com',
        status: statusFromString(servers[2]['account.mojang.com']),
      ),
      MojangServer(
        name: 'Auth server',
        url: 'authserver.mojang.com',
        status: statusFromString(servers[3]['authserver.mojang.com']),
      ),
      MojangServer(
        name: 'Session server',
        url: 'sessionserver.mojang.com',
        status: statusFromString(servers[4]['sessionserver.mojang.com']),
      ),
      MojangServer(
        name: 'API server',
        url: 'api.mojang.com',
        status: statusFromString(servers[5]['api.mojang.com']),
      ),
      MojangServer(
        name: 'Texture server',
        url: 'textures.minecraft.net',
        status: statusFromString(servers[6]['textures.minecraft.net']),
      ),
      MojangServer(
        name: 'Mojang',
        url: 'mojang.com',
        status: statusFromString(servers[7]['mojang.com']),
      ),
    ];
  }
}
