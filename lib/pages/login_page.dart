import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_3bee/app_router.gr.dart';
import 'package:interview_3bee/pages/cubit/login_page_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String apiariesId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginPageCubit(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onSaved: (newValue) => username = newValue!,
                      decoration: const InputDecoration(labelText: 'Username'),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please enter a username'
                          : null,
                    ),
                    TextFormField(
                      onSaved: (newValue) => password = newValue!,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please enter a password'
                          : null,
                    ),
                    TextFormField(
                        onSaved: (newValue) => apiariesId = newValue!,
                        decoration:
                            const InputDecoration(labelText: 'Apiaries ID'),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Please enter an Apiaries ID'
                            : null),
                    BlocConsumer<LoginPageCubit, LoginPageState>(
                        builder: ((context, state) {
                          return Column(
                            children: [
                              FilledButton(
                                  onPressed: () {
                                    if (_formKey.currentState != null &&
                                        _formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      context.read<LoginPageCubit>().login(
                                          username: username,
                                          password: password,
                                          apiariesId: apiariesId);
                                    }
                                  },
                                  child: const Text('Login')),
                              state.maybeWhen(
                                loading: (username, password, apiariesId) =>
                                    const CircularProgressIndicator(),
                                failure:
                                    (username, password, apiariesId, error) =>
                                        Text(error),
                                orElse: () => Container(),
                              ),
                            ],
                          );
                        }),
                        listener: ((context, state) => {
                              state.maybeWhen(
                                success:
                                    (username, password, apiariesId, user) {
                                  context.navigateTo(
                                    HivesPageRoute(
                                        apiariesId: apiariesId, user: user),
                                  );
                                },
                                orElse: () {},
                              )
                            }))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
