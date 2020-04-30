enum MojangServerStatus {
  green,
  yellow,
  red,
}

extension ext on MojangServerStatus {
  String get name {
    return this.toString().split('.').last;
  }
}

Map<String, MojangServerStatus> _map = Map.fromIterable(
  MojangServerStatus.values,
  key: (d) => (d as MojangServerStatus).name,
  value: (d) => d,
);

MojangServerStatus statusFromString(String s) {
  if (_map.containsKey(s)) {
    return _map[s];
  } else {
    print("Could not parse '$s' to MojangServerStatus");
    return null;
  }
}
