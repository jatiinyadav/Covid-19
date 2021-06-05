// import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:flutter/material.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  const GlobalStatistics({Key? key, required this.summary}) : super(key: key);

  String Function(Match match) get mathFunc => mathFunc;

  Pattern get reg => reg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "CONFIRMED",
          summary.totalConfirmed,
          summary.newConfirmed,
          Colors.red,
        )
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
