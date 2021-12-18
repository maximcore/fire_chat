import 'package:fire_chat/string_constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _placeholderContainer() {
    return Container(
      color: Colors.grey,
      height: 16,
      width: 64,
      margin: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.profilePageTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.black,
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 128,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Username',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _placeholderContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                  _placeholderContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                  _placeholderContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
