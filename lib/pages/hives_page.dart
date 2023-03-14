import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_3bee/http/models/apiaries_line_response.dart';

import '../data/user.dart';
import '../http/models/hive_line_response.dart';
import 'cubit/hives_page_cubit.dart';

class HivesPage extends StatelessWidget {
  final User user;
  final ApiariesLineResponse apiariesLineResponse;
  const HivesPage(
      {super.key, required this.user, required this.apiariesLineResponse});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HivesPageCubit()
        ..fetchHives(apiariesLineResponse.id.toString(), user),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hives for ${apiariesLineResponse.id.toString()}'),
          ),
          body: Center(
            child: BlocBuilder<HivesPageCubit, HivesPageState>(
                builder: (context, state) {
              return state.when(
                  initial: () => CircularProgressIndicator(),
                  loading: () => CircularProgressIndicator(),
                  success: (hives) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hives.results.length,
                      itemBuilder: (context, index) {
                        final hive = hives.results[index];
                        final weights = apiariesLineResponse.weights["delta"]
                            [hive.id.toString()] as Map<String, dynamic>;
                        final lastEntry = weights.entries.last;

                        return HiveCard(
                            hive: hive,
                            weight: lastEntry.value,
                            lastUpdate: DateTime.fromMillisecondsSinceEpoch(
                                int.parse(lastEntry.key) * 1000));
                      },
                    );
                  },
                  failure: (error) => Text(error));
            }),
          )),
    );
  }
}

class HiveCard extends StatelessWidget {
  final num weight;
  final DateTime lastUpdate;
  final HiveLineResponse hive;
  const HiveCard(
      {super.key,
      required this.hive,
      required this.weight,
      required this.lastUpdate});

  @override
  Widget build(BuildContext context) {
    const whiteTextStyle = TextStyle(color: Colors.white);
    return Center(
        child: SizedBox(
      width: 200,
      height: 200,
      child: Card(
        elevation: 0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Stack(fit: StackFit.expand, children: [
          Image.network(
            hive.imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(hive.name, style: whiteTextStyle),
              ),
              Expanded(child: Container()),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  width: 100,
                  height: 30,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(weight.toStringAsFixed(2), style: whiteTextStyle),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text('kg',
                                style: whiteTextStyle.copyWith(fontSize: 10)),
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${lastUpdate.day}/${lastUpdate.month}/${lastUpdate.year}',
                        style: whiteTextStyle),
                    Text(hive.externalId.substring(hive.externalId.length - 8),
                        style: whiteTextStyle),
                  ],
                ),
              ),
              SizedBox(height: 12)
            ]),
          ),
        ]),
      ),
    ));
  }
}
