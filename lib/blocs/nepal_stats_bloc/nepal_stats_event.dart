part of 'nepal_stats_bloc.dart';

@immutable
abstract class NepalStatsEvent {
  const NepalStatsEvent();
}

class GetNepalStatsEvent extends NepalStatsEvent {
  const GetNepalStatsEvent();
}
