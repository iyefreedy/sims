import 'package:flutter/material.dart';
import 'package:sims/models/classes.dart';
import 'package:sims/services/cloud/firebase_cloud_storage.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  late FirebaseCloudStorage _firebaseCloudStorage;

  @override
  void initState() {
    _firebaseCloudStorage = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<Classes>>(
        stream: _firebaseCloudStorage.allClasses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final classes = snapshot.data!;

            return ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${classes[index].classCode}'),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
