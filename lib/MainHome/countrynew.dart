import 'package:covid19_app_flutter/MainHome/countrystatisticsnew.dart';
import 'package:covid19_app_flutter/Services/covid_service.dart';
import 'package:covid19_app_flutter/models/country.dart';
import 'package:covid19_app_flutter/models/country_summary.dart';
import 'package:flutter/material.dart';

CovidService covidService = CovidService();

class CountrNew extends StatefulWidget {
  const CountrNew({Key? key}) : super(key: key);

  @override
  _CountrNewState createState() => _CountrNewState();
}

class _CountrNewState extends State<CountrNew> {
  Future<List<CountryModel>>? countryList;

  Future<List<CountrySummaryModel>>? summaryList;

  @override
  void initState() {
    super.initState();

    countryList = covidService.getCountryList();
    summaryList = covidService.getCountrySummary("India");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Network Error",
              style: TextStyle(
                color: Colors.amberAccent,
              ),
            ),
          );
        }
        switch (snapshot.connectionState) {
          default:
            return !snapshot.hasData
                ? Center(
                    child: Text(
                      "Network Error",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                      // ),
                      FutureBuilder(
                        future: summaryList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Network Error"),
                            );
                          }
                          switch (snapshot.connectionState) {
                            default:
                              return !snapshot.hasData
                                  ? Center(
                                      child: Text("Network Error"),
                                    )
                                  : CountryStatisticNew(
                                      summaryList:
                                          buildDataSuggestion(snapshot),
                                    );
                          }
                        },
                      ),
                    ],
                  );
        }
      },
    );
  }

  buildDataSuggestion(AsyncSnapshot<Object?> snapshot) {
    return snapshot.data;
  }
}
