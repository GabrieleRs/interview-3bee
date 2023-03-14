import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_router.gr.dart';
import '../data/user.dart';
import 'cubit/apiaries_page_cubit.dart';

class ApiariesPage extends StatelessWidget {
  final User user;
  const ApiariesPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiariesPageCubit()..fetchApiaries(user),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Apiaries'),
        ),
        body: SafeArea(
          child: BlocBuilder<ApiariesPageCubit, ApiariesPageState>(
            builder: (context, state) {
              return state.when(
                  initial: () =>
                      Center(child: const CircularProgressIndicator()),
                  loading: () =>
                      Center(child: const CircularProgressIndicator()),
                  success: (apiaries) {
                    return ListView.builder(
                      itemCount: apiaries.results.length,
                      itemBuilder: (context, index) {
                        final apiares = apiaries.results[index];
                        return ListTile(
                          title: Text(apiares.name),
                          subtitle: Text(apiares.id.toString()),
                          onTap: () {
                            context.navigateTo(
                              HivesPageRoute(
                                apiariesId: apiares.id.toString(),
                                user: user,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  failure: (error) => Text(error));
            },
          ),
        ),
      ),
    );
  }
}
