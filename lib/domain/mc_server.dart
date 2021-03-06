class McServer {
  static int defaultPort = 25565;

  final String hostname;
  final int port;

  String get id => '$hostname:$port';

  McServer(this.hostname, this.port);

  @override
  String toString() {
    return '$hostname:$port';
  }

  String toDisplayString() {
    if (port == defaultPort) {
      return hostname;
    } else {
      return '$hostname:$port';
    }
  }

  static McServer parse(final String str) {
    String hostname;
    int port;

    if (str.contains(':')) {
      final index = str.lastIndexOf(':');
      hostname = str.substring(0, index);
      port = int.tryParse(str.substring(index + 1));
    } else {
      hostname = str;
      port = defaultPort;
    }

    _validateHostname(hostname);
    _validatePort(port);
    return McServer(hostname, port);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is McServer && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class EmptyHostnameException implements Exception {}

class InvalidPortNumberException implements Exception {}

class NegativePortNumberException implements Exception {}

class TooLargePortNumberException implements Exception {}
