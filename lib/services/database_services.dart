import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/firebase/todo.dart';

const String todoCollectionRef = "FlutterCourse";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosRef;

  DatabaseService() {
    _todosRef = _firestore.collection(todoCollectionRef).withConverter<Todo>(
        fromFirestore: (snapshots, _) => Todo.fromJson(snapshots.data()!),
        toFirestore: (todo, _) => todo.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return _todosRef.snapshots();
  }

  void addTodo(Todo todo) async {
    _todosRef.add(todo);
  }
}
