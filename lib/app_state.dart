import 'package:flutter/widgets.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/services/server_service.dart';

class AppState with ChangeNotifier {

  final ServerService serverService;
  
  Category _category = Category.myServers;
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

  Future<void> addServer(String address) async {


    if(address.contains)
    final index = address.lastIndexOf(':');
    final port = int.tryParse(address.substring(index + 1));

    _servers.add(server);
    await serverService.saveServers(_servers);
    notifyListeners();
  }

}
