
import 'package:course/Pages/NewGoal.dart';
import 'package:course/firebase/todo.dart';
import 'package:course/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DatabaseService _databaseService = DatabaseService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Goals",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewGoal()));
        },
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _messagesListView(context),
        ],
      ),
    );
  }

  Widget _messagesListView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      width:  MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: _databaseService.getTodos(),
        builder: (context, snapshot) {
          List todos = snapshot.data?.docs ?? [];
          if (todos.isEmpty) {
            return const Center(
              child: Text("Add a todo"),
            );
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              Todo todo = todos[index].data();
              String todoId = todos[index].id;
              print(todoId);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                  title: Text(todo.task),
                  subtitle: Text(
                    DateFormat("dd-MM-yyyy h:m a").format(
                      todo.updatedOn.toDate(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
