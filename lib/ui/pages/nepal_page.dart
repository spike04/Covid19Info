import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid19_info/blocs/hospital_bloc/hospital_bloc.dart';
import 'package:covid19_info/blocs/nepal_stats_bloc/nepal_stats_bloc.dart';

import 'package:covid19_info/ui/styles/styles.dart';
import 'package:covid19_info/ui/widgets/common/search_box.dart';
import 'package:covid19_info/ui/widgets/nepal_page/stats_grid.dart';
import 'package:covid19_info/ui/widgets/indicators/empty_icon.dart';
import 'package:covid19_info/ui/widgets/indicators/error_icon.dart';
import 'package:covid19_info/ui/widgets/nepal_page/hospital_list.dart';
import 'package:covid19_info/ui/widgets/indicators/busy_indicator.dart';
import 'package:covid19_info/ui/widgets/common/collapsible_appbar.dart';

class NepalPage extends StatefulWidget {
  const NepalPage();

  @override
  _NepalPageState createState() => _NepalPageState();
}

class _NepalPageState extends State<NepalPage> {
  @override
  void initState() {
    super.initState();
    context.bloc<NepalStatsBloc>()..add(GetNepalStatsEvent());
    context.bloc<HospitalBloc>()..add(GetHospitalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          const CollapsibleAppBar(
            elevation: 0.0,
            title: 'NEPAL STATS',
            imageUrl: 'assets/images/nepal_header.png',
          ),
        ],
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _buildNepalStats(),
            const SizedBox(height: 32.0),
            Center(
              child: Text(
                'HOSPITALS',
                style: AppTextStyles.largeLight,
              ),
            ),
            const SizedBox(height: 16.0),
            SearchBox(
              hintText: 'Search Hospitals',
              onChanged: (String value) {
                context.bloc<HospitalBloc>()
                  ..add(SearchHospitalEvent(
                    searchTerm: value,
                  ));
              },
            ),
            _buildHospitalList(),
          ],
        ),
      ),
    );
  }

  Widget _buildNepalStats() {
    return BlocBuilder<NepalStatsBloc, NepalStatsState>(
      builder: (context, state) {
        if (state is InitialNepalStatsState) {
          return const EmptyIcon();
        } else if (state is LoadedNepalStatsState) {
          return StatsGrid(state: state);
        } else if (state is ErrorNepalStatsState) {
          return ErrorIcon(message: state.message);
        } else {
          return const BusyIndicator();
        }
      },
    );
  }

  Widget _buildHospitalList() {
    return BlocBuilder<HospitalBloc, HospitalState>(
      builder: (context, state) {
        if (state is InitialHospitalState) {
          return const EmptyIcon();
        } else if (state is LoadedHospitalState) {
          return HospitalList(hospitals: state.hospitals);
        } else if (state is ErrorHospitalState) {
          return ErrorIcon(message: state.message);
        } else {
          return const BusyIndicator();
        }
      },
    );
  }
}
