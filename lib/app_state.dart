import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/domain/mojang_server.dart';
import 'package:mcss/services/mc_server_service.dart';
import 'package:mcss/services/mojang_server_service.dart';

class AppState with ChangeNotifier {
  final Logger log = Logger('MCSS.AppState');
  final McServerService mcServerService;
  final MojangServerService mojangServerService;

  bool _loading = false;
  Category _category;
  List<McServer> _mcServers = List();
  List<MojangServer> _mojangServers = [];
  McServer _mcServer;

  AppState(this.mcServerService, this.mojangServerService);

  bool get loading => _loading;

  Category get category => _category;

  List<McServer> get mcServers => _mcServers;

  List<MojangServer> get mojangServers => _mojangServers;

  McServer get mcServer => _mcServer;

  set category(Category value) {
    _category = value;
    notifyListeners();

    switch (value) {
      case Category.myServers:
        _loadMcServers();
        break;
      case Category.mojang:
        _loadMojangServers();
        break;
    }
  }

  Future<void> _loadMcServers() async {
    _loading = true;
    notifyListeners();
    _mcServers = await mcServerService.loadServers();
    _loading = false;
    notifyListeners();
  }

  Future<void> _loadMojangServers() async {
    _loading = true;
    notifyListeners();
    _mojangServers = await mojangServerService.loadServers();
    _loading = false;
    notifyListeners();
  }

  Future<void> addMcServer(McServer mcServer) async {
    log.fine("Adding MC server: $mcServer");
    _mcServers.add(mcServer);
    await mcServerService.saveServers(_mcServers);
    notifyListeners();
  }

  void selectMcServer(McServer mcServer) {
    _mcServer = mcServer;
    notifyListeners();
  }

  Future<StatusResponse> pingMcServer(McServer mcServer) async {
    return await mcServerService.ping(mcServer);
  }
}
