import 'package:covid19_app_flutter/Services/covid_service.dart';
import 'package:covid19_app_flutter/models/country.dart';
import 'package:covid19_app_flutter/models/country_summary.dart';
import 'package:covid19_app_flutter/screens/country_loading.dart';
import 'package:covid19_app_flutter/screens/country_statistics.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final TextEditingController _typeAheadController = TextEditingController();

  Future<List<CountryModel>>? countryList;

  Future<List<CountrySummaryModel>>? summaryList;

  @override
  void initState() {
    super.initState();

    countryList = covidService.getCountryList();
    summaryList = covidService.getCountrySummary("India");

    this._typeAheadController.text = "India";
  }

  List<String> _getSuggestions(List<CountryModel> list, String query) {
    // ignore: deprecated_member_use
    List<String> matches = [];

    for (var item in list) {
      matches.add(item.country);
    }

    matches.retainWhere(
      (element) => element.toLowerCase().contains(
            query.toLowerCase(),
          ),
    );
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CountryLoading(inputTextLoading: true);
          default:
            return !snapshot.hasData
                ? Center(
                    child: Text("Empty"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        child: Text(
                          "Type the Country Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _typeAheadController,
                          decoration: InputDecoration(
                            hintText: "Type Country Name",
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: EdgeInsets.all(20),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 24, right: 16),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          return _getSuggestions(
                              buildDataSuggestion(snapshot), pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.toString()),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text =
                              suggestion.toString();
                          setState(
                            () {
                              summaryList = covidService.getCountrySummary(
                                  buildDataSuggestion(snapshot)
                                      .data
                                      .firstWhere((element) =>
                                          element.country == suggestion)
                                      .slug);
                            },
                          );
                        },
                      ),
                      //
                      SizedBox(
                        height: 8,
                      ),
                      //
                      FutureBuilder(
                        future: summaryList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Error"),
                            );
                          }
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return CountryLoading(inputTextLoading: false);
                            default:
                              return !snapshot.hasData
                                  ? Center(
                                      child: Text("Empty"),
                                    )
                                  : CountryStatistics(
                                      summaryList:
                                          buildDataSuggestion(snapshot),
                                    );
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Image.asset("assets/images/earth-grid.png"),
                      SizedBox(height: 20.0),
                      Text(
                        "Government of India is taking all necessary steps to ensure that we are prepared well to face the challenge and threat posed by the growing pandemic of COVID-19 the Corona Virus.",
                        textAlign: TextAlign.center,
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
