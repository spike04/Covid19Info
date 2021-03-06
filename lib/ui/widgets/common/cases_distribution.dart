import 'package:flutter/material.dart';

import 'package:covid19_info/ui/styles/styles.dart';
import 'package:covid19_info/ui/widgets/common/label.dart';
import 'package:covid19_info/ui/widgets/common/cases_distribution_pie_chart.dart';

class CasesDistribution extends StatelessWidget {
  final int active;
  final int deaths;
  final int recovered;

  const CasesDistribution({
    @required this.active,
    @required this.deaths,
    @required this.recovered,
  })  : assert(active != null),
        assert(deaths != null),
        assert(recovered != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'CASES DISTRIBUTION',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppTextStyles.mediumLight,
        ),
        SizedBox(
          height: 250.0,
          child: CasesDistributionPieChart(
            opacity: 0.4,
            active: active,
            deaths: deaths,
            recovered: recovered,
            showPercent: true,
            radius: 45.0,
            centerSpaceRadius: 55.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Label(text: 'Deaths ($deaths)', color: Colors.red),
            const SizedBox(height: 8.0),
            Label(text: 'Active ($active)', color: Colors.yellow),
            const SizedBox(height: 8.0),
            Label(text: 'Recovered ($recovered)', color: Colors.green),
          ],
        ),
      ],
    );
  }
}
