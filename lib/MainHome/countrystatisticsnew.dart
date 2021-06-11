import 'package:covid19_app_flutter/models/country_summary.dart';
import 'package:flutter/material.dart';

class CountryStatisticNew extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  const CountryStatisticNew({Key? key, required this.summaryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "CONFIRMED",
          summaryList[summaryList.length - 1].confirmed,
          Colors.red,
          "ACTIVE",
          summaryList[summaryList.length - 1].active,
          Colors.blue,
        ),
        buildCard(
          "RECOVERED",
          summaryList[summaryList.length - 1].recovered,
          Colors.green,
          "DEATH",
          summaryList[summaryList.length - 1].death,
          Colors.grey,
        )
      ],
    );
  }

  Widget buildCard(
    String leftTitle,
    int leftValue,
    Color leftColor,
    String rightTitle,
    int rightValue,
    Color rightColor,
  ) {
    return Card(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  leftValue.toString(),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  rightValue.toString(),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
