// import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatisticNew extends StatelessWidget {
  final GlobalSummaryModel summary;

  const GlobalStatisticNew({Key? key, required this.summary}) : super(key: key);

  // String Function(Match match) get mathFunc => mathFunc;

  // Pattern get reg => reg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "CONFIRMED",
          summary.totalConfirmed,
          summary.newConfirmed,
          Colors.red,
        ),
        buildCard(
          "ACTIVE",
          summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          Colors.blue,
        ),
        buildCard(
          "RECOVERED",
          summary.totalRecovered,
          summary.newRecovered,
          Colors.green,
        ),
        buildCard(
          "DEATH",
          summary.totalDeaths,
          summary.newDeaths,
          Colors.grey.shade500,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 6,
          ),
          child: Text(
            "Statistics Updated " + timeago.format(summary.date),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }

  Widget buildCard(
    String title,
    int totalCount,
    int todayCount,
    Color color,
  ) {
    return Card(
      elevation: 1,
      child: Container(
        color: Colors.white38,
        height: 90,
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
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      todayCount.toString(),
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
