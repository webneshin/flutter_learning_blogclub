import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            child: Assets.img.icons.logo.svg(width: 120),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = loginTab;
                            });
                          },
                          child: Text(
                            "Login".toUpperCase(),
                            style: tabTextStyle.apply(
                                color: selectedTabIndex == loginTab
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = signUpTab;
                            });
                          },
                          child: Text(
                            "Sign UP".toUpperCase(),
                            style: tabTextStyle.apply(
                                color: selectedTabIndex == signUpTab
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: selectedTabIndex == loginTab
                            ? _Login(theme: theme)
                            : _SignUp(theme: theme),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Sign in with your Account",
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60))),
            child: Text("Login".toUpperCase())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forget your password"),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: const Text("Reset here")),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "or sign in with".toUpperCase(),
            style: const TextStyle(letterSpacing: 1.5),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Blog Club",
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "please enter your information",
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Full name")),
        ),
        const TextField(
          decoration: InputDecoration(label: Text("Username")),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60))),
            child: Text("Sign up".toUpperCase())),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "or sign up with".toUpperCase(),
            style: const TextStyle(letterSpacing: 1.5),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text("Password"),
        suffix: TextButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(obscureText ? "Show" : "Hide")),
      ),
    );
  }
}
