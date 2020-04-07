import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:covid19_info/core/models/timeline_data.dart';

class NepalStats {
  final int total;
  final int positive;
  final int negative;
  final int isolation;
  final int deaths;
  final List<TimelineData> timeline;

  NepalStats({
    @required this.total,
    @required this.positive,
    @required this.negative,
    @required this.isolation,
    @required this.deaths,
    @required this.timeline,
  })  : assert(total != null),
        assert(positive != null),
        assert(negative != null),
        assert(isolation != null),
        assert(deaths != null),
        assert(timeline != null);

  NepalStats copyWith({
    int total,
    int positive,
    int negative,
    int isolation,
    int deaths,
    List<TimelineData> timeline,
  }) {
    return NepalStats(
      total: total ?? this.total,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      isolation: isolation ?? this.isolation,
      deaths: deaths ?? this.deaths,
      timeline: timeline ?? this.timeline,
    );
  }

  static NepalStats fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NepalStats(
      total: map['tested_total'],
      positive: map['tested_positive'],
      negative: map['tested_negative'],
      isolation: map['in_isolation'],
      deaths: map['deaths'],
      timeline: map.containsKey('timeline')
          ? List<TimelineData>.from(map['timeline']?.map((x) => TimelineData.fromMap(x)))
          : [],
    );
  }

  @override
  String toString() {
    return 'NepalStats(total: $total, positive: $positive, negative: $negative, isolation: $isolation, deaths: $deaths, timeline: $timeline)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NepalStats &&
        o.total == total &&
        o.positive == positive &&
        o.negative == negative &&
        o.isolation == isolation &&
        o.deaths == deaths &&
        listEquals(o.timeline, timeline);
  }

  @override
  int get hashCode {
    return total.hashCode ^
        positive.hashCode ^
        negative.hashCode ^
        isolation.hashCode ^
        deaths.hashCode ^
        timeline.hashCode;
  }
}
