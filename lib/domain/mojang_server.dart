
class MojangServer {
  final String name;
  final String url;
  final String status;

  MojangServer({ this.name, this.url, this.status });

  @override
  String toString() {
    return '$name ($url) - $status';
  }
}
