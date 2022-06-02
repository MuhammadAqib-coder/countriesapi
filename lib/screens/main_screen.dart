import 'dart:async';
import 'dart:convert';
import 'package:countries_api/models/countries_model.dart';
import 'package:countries_api/screens/country_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List list = <CountryModel>[];
  late StreamController controler;
  late Stream stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controler = StreamController();
    stream = controler.stream;
    getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text("Countries"),
        ),
        body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // var list = snapshot.data! as List<Map<String, dynamic>>;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black,
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2)),
                        child: ClipOval(
                          child: Image.network(
                            list[index].flags,
                          ),
                        ),
                      ),
                      title: Text(
                        list[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    CountryDetail(model: list[index])));
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  void getAllCountries() async {
    var url = "https://restcountries.com/v2/all";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);
      for (var map in jsonDecode) {
        var country = CountryModel.fromJson(map);
        list.add(country);
      }
      controler.add(jsonDecode);
    } else {
      controler.add("something is went wrong");
    }
  }
}
