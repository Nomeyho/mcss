import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/services/server_service.dart';

class AppState with ChangeNotifier {

  final Logger log = Logger('AppState');
  final ServerService serverService;
  
  Category _category = Category.myServers;
  List<Server> _servers = List();

  AppState(this.serverService);

  Category get category => _category;

  set category(Category value) {
    _category = value;
    notifyListeners();
    loadServers();
  }
  
  get servers => _servers;
  
  Future<void> loadServers() async {
    // TODO use category
    _servers = await serverService.loadServers();
    notifyListeners();
  }

  Future<void> addServer(Server server) async {
    log.fine("Adding server: $server");
    _servers.add(server);
    await serverService.saveServers(_servers);
    notifyListeners();
  }
}
