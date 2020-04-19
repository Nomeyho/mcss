import 'package:flutter/widgets.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/services/server_service.dart';

class AppState with ChangeNotifier {

  final ServerService serverService;
  
  Category _category;
  List<Server> _servers;

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

}
