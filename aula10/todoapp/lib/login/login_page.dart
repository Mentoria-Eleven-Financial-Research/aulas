import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/home/home_page.dart';
import 'package:todoapp/login/bloc/login_bloc.dart';
import 'package:todoapp/login/bloc/login_event.dart';
import 'package:todoapp/login/bloc/login_state.dart';
import 'package:todoapp/login/repositories/login_repository.dart';
import 'package:todoapp/login/repositories/login_repository_impl.dart';
import 'package:todoapp/shared/widgets/button.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<LoginRepository>(
      create: (context) => LoginRepositoryImpl(),
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          repository: context.read<LoginRepository>(),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: ((context, state) {
            state.when(
              onLoading: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              onSuccess: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  HomePage.routeName,
                );
              },
              onError: (e) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (_) => Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    e.toString(),
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Button(
                                    active: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    title: 'Ok',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
              },
            );
          }),
          listenWhen: (previousState, state) {
            return ((state is LoginStateLoading) ||
                (state is LoginStateSuccess) ||
                (state is LoginStateError));
          },
          child: Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 140),
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Hero(
                            tag: 'image01',
                            child: Image.asset(
                              "assets/images/image01.png",
                              height: 300,
                            ),
                          ),
                          const SizedBox(
                            height: 57,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Builder(builder: (context) {
                                return TextField(
                                  controller: _userController,
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                        _passwordController.text.isEmpty) {
                                      context
                                          .read<LoginBloc>()
                                          .add(InvalidLoginOrPasswordEvent());
                                    } else {
                                      context
                                          .read<LoginBloc>()
                                          .add(ValidLoginOrPasswordEvent());
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Enter your email",
                                    border: InputBorder.none,
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                buildWhen: (previous, current) {
                                  return ((current
                                          is InvalidUserOrPasswordLoginState) ||
                                      (current is LoginStateRegular));
                                },
                                builder: (context, state) => TextFormField(
                                  controller: _passwordController,
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                        _userController.text.isEmpty) {
                                      context
                                          .read<LoginBloc>()
                                          .add(InvalidLoginOrPasswordEvent());
                                    } else {
                                      context
                                          .read<LoginBloc>()
                                          .add(ValidLoginOrPasswordEvent());
                                    }
                                  },
                                  validator: (value) {
                                    return state
                                            is InvalidUserOrPasswordLoginState
                                        ? ' Usu??rio ou senha inv??lidos'
                                        : null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Enter password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: LoginButton(
                              password: _passwordController.text,
                              user: _userController.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.user,
    required this.password,
  }) : super(key: key);

  final String user;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        return ((current is InvalidUserOrPasswordLoginState) ||
            (current is LoginStateRegular));
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: state is! InvalidUserOrPasswordLoginState
                ? MaterialStateProperty.all(
                    const Color(0xff38C24E),
                  )
                : MaterialStateProperty.all(
                    Colors.grey,
                  ),
          ),
          onPressed: state is LoginStateRegular
              ? () {
                  context.read<LoginBloc>().add(
                        TryLoginEvent(
                          user: user,
                          password: password,
                        ),
                      );
                }
              : null,
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
