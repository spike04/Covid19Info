import 'dart:convert';

import 'package:meta/meta.dart';

class WorldInfectionData {
  final int confirmed;
  final int deaths;
  final int recovered;

  WorldInfectionData({
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
  })  : assert(confirmed != null),
        assert(deaths != null),
        assert(recovered != null);

  WorldInfectionData copyWith({
    int confirmed,
    int deaths,
    int recovered,
  }) {
    return WorldInfectionData(
      confirmed: confirmed ?? this.confirmed,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'confirmed': confirmed,
      'deaths': deaths,
      'recovered': recovered,
    };
  }

  static WorldInfectionData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WorldInfectionData(
      confirmed: map['confirmed'],
      deaths: map['deaths'],
      recovered: map['recovered'],
    );
  }

  String toJson() => json.encode(toMap());

  static WorldInfectionData fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'WorldInfectionData(confirmed: $confirmed, deaths: $deaths, recovered: $recovered)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WorldInfectionData &&
        o.confirmed == confirmed &&
        o.deaths == deaths &&
        o.recovered == recovered;
  }

  @override
  int get hashCode => confirmed.hashCode ^ deaths.hashCode ^ recovered.hashCode;
}
