import 'package:flutter/material.dart';
import 'package:course/Pages/HomePage.dart';

class NewGoal extends StatelessWidget {
  const NewGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Goal",
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 150, 30, 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text(
              'Create A Goal',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Goal Name"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Expected Time"),
                hintText: "Hours",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Date of Completing"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
          ]),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 250.0,
        height: 45.0,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
            ),
            child: const Text(
              "Create",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
