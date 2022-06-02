import 'package:countries_api/models/countries_model.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  final CountryModel model;

  CountryDetail({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(model.name),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(model.flags!,fit: BoxFit.cover,),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Region:    ${model.region}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Population:    ${model.population}",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Text("Capital:    ${model.capital}",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Text("SubRegion:    ${model.subRegion}",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Visibility(
                visible: model.borders == null ? false : true,
                child: const Text("Boundries with other Countries",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
            Container(
              height: 80,
              width: double.infinity,
              child: model.borders == null
                  ? const Text('')
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.borders!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black38),
                          child: Center(
                              child: Card(
                                  color: Colors.black12,
                                  child: Text(
                                    model.borders![index],
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        );
                      },
                    ),
            )
            // Visibility(
            //   visible: isListening,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         Wrap(
            //           children: List.generate(widget.model.borders!.length,
            //               (index) => Text(widget.model.borders![index])),
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
