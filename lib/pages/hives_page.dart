import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/user.dart';
import '../http/models/hive_line_response.dart';
import 'cubit/hives_page_cubit.dart';

class HivesPage extends StatelessWidget {
  final String apiariesId;
  final User user;
  const HivesPage({super.key, required this.apiariesId, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HivesPageCubit()..fetchHives(apiariesId, user),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hives for $apiariesId'),
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
                        return HiveCard(hive: hives.results[index]);
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
  final HiveLineResponse hive;
  const HiveCard({super.key, required this.hive});

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
          side: BorderSide(
            color: Colors.green,
          ),
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
                  width: 100,
                  height: 30,
                  color: Colors.green,
                  child: Center(child: Text('TODO :(', style: whiteTextStyle))),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TODO :(', style: whiteTextStyle),
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
