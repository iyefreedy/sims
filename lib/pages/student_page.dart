import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text('Student Page'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Get token'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
