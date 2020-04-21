class Server {
  final String hostname;
  final int port;

  Server(this.hostname, this.port);

  @override
  String toString() {
    return '$hostname:$port';
  }

  static Server parse(final String str) {
    String hostname;
    int port;

    if (str.contains(':')) {
      final index = str.lastIndexOf(':');
      hostname = str.substring(0, index);
      port = int.tryParse(str.substring(index + 1));
    } else {
      hostname = str;
      port = 25565;
    }

    _validateHostname(hostname);
    _validatePort(port);
    return Server(hostname, port);
  }

  static _validateHostname(String hostname) {
    if (hostname.isEmpty) {
      throw EmptyHostnameException();
    }
  }

  static _validatePort(int port) {
    if (port == null) {
      throw InvalidPortNumberException();
    } else if (port < 0) {
      throw NegativePortNumberException();
    } else if (port > 65535) {
      throw TooLargePortNumberException();
    }
  }
}

class EmptyHostnameException implements Exception {}

class InvalidPortNumberException implements Exception {}

class NegativePortNumberException implements Exception {}

class TooLargePortNumberException implements Exception {}
