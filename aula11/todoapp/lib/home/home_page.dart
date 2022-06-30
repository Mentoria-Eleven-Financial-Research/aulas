import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/home/bloc/home_controller.dart';
import 'package:todoapp/home/bloc/home_state.dart';
import 'package:todoapp/login/repositories/login_repository_impl.dart';

import 'widgets/home_fab.dart';
import 'widgets/notes_body.dart';

typedef Task = Map<String, dynamic>;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(repository: LoginRepositoryImpl()),
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          title: const Text('TodoApp'),
          backgroundColor: const Color(0xffE5E5E5),
          elevation: 0,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (
            context,
            state,
          ) {
            return state.when(
              onChanging: const Center(
                child: CircularProgressIndicator(),
              ),
              onEmpty: SingleChildScrollView(
                child: Column(
                  children: const [
                    NotesTodo(),
                    FinishedNotes(),
                  ],
                ),
              ),
              onRegular: SingleChildScrollView(
                child: Column(
                  children: const [
                    NotesTodo(),
                    FinishedNotes(),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: const HomeFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
