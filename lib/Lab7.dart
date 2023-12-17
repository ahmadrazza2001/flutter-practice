import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(Lab7());
}

class Lab7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lab7Home(),
    );
  }
}

class Lab7Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Employee Management"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Add Employee"),
              Tab(text: "Update/Delete Employee"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddEmployeeTab(),
            UpdateDeleteEmployeeTab(),
          ],
        ),
      ),
    );
  }
}

class AddEmployeeTab extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: cityController,
            decoration: InputDecoration(labelText: 'City'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              employees.add({
                'name': nameController.text,
                'email': emailController.text,
                'city': cityController.text,
              });

              nameController.clear();
              emailController.clear();
              cityController.clear();
            },
            child: Text("Add Employee"),
          ),
        ],
      ),
    );
  }
}

class UpdateDeleteEmployeeTab extends StatelessWidget {
  final CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: employees.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var employee = snapshot.data!.docs[index];
            return ListTile(
              title: Text(employee['name']),
              subtitle: Text('${employee['email']}, ${employee['city']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Navigate to the screen for updating employee
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      employees.doc(employee.id).delete().then((_) {
                        // Redirect to Tab 2 after deletion
                        DefaultTabController.of(context)!.animateTo(1);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
