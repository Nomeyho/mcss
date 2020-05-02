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
  bool _error = false;
  Category _category;
  List<McServer> _mcServers = List();
  List<MojangServer> _mojangServers = [];
  McServer _mcServer;
  StatusResponse _mcServerStatus;

  AppState(this.mcServerService, this.mojangServerService);

  bool get loading => _loading;

  bool get error => _error;

  Category get category => _category;

  List<McServer> get mcServers => _mcServers;

  List<MojangServer> get mojangServers => _mojangServers;

  McServer get mcServer => _mcServer;

  StatusResponse get mcServerStatus => _mcServerStatus;

  set category(Category value) {
    _category = value;
    notifyListeners();

    switch (value) {
      case Category.myServers:
        loadMcServers();
        break;
      case Category.mojang:
        loadMojangServers();
        break;
    }
  }

  Future<void> loadMcServers() async {
    _loading = true;
    _error = false;
    notifyListeners();
    _mcServers = await mcServerService.loadServers();
    _loading = false;
    notifyListeners();
  }

  Future<void> loadMojangServers() async {
    _loading = true;
    _error = false;
    notifyListeners();

    try {
      _mojangServers = await mojangServerService.loadServers();
      _error = false;
    } catch(e) {
      _mojangServers = [];
      _error = true;
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> addMcServer(McServer mcServer) async {
    log.fine("Adding MC server: $mcServer");
    _mcServers.add(mcServer);
    await mcServerService.saveServers(_mcServers);
    notifyListeners();
  }

  Future<void> removeMcServer(McServer mcServer) async {
    log.fine("Removing MC server: $mcServer");
    _mcServers.removeWhere((s) => s.id == mcServer.id);
    await mcServerService.saveServers(_mcServers);
    log.fine("List now contains ${_mcServers.length} servers");
    notifyListeners();
  }

  void selectMcServer(McServer mcServer, StatusResponse mcServerStatus) {
    _mcServer = mcServer;
    _mcServerStatus = mcServerStatus;
    notifyListeners();
  }

  Future<StatusResponse> pingMcServer(McServer mcServer) async {
    return await mcServerService.ping(mcServer);
  }
}
