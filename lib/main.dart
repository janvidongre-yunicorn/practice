import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'isolate/home_screen.dart';
import 'isolate/profile_page.dart';
import 'isolate_bloc/task_bloc.dart';


void main() {
  runApp(MyApp());
}

// 🔹 Global StreamController for task completion
//final StreamController<bool> taskDoneController = StreamController.broadcast();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(),
      child: MaterialApp(
        title: 'Bloc Isolate',
        home: HomePage(),
        routes: {'/profile': (_) => ProfilePage()},
      ),
    );
  }
}













// import 'enum&sealed/sealed.dart';
//
// void main() {
//
//   print("LIST=============================================================================");
//   List<String> studentNames = ["Janvi", "Rahul", "Sneha", "Rahul"];
//   print("Original List: $studentNames\n");
//
//   // =================== Basic Properties
//   print("Length: ${studentNames.length}");
//   print("isEmpty: ${studentNames.isEmpty}");
//   print("isNotEmpty: ${studentNames.isNotEmpty}");
//   print("First: ${studentNames.first}");
//   print("Last: ${studentNames.last}");
//   print("Reversed: ${studentNames.reversed}\n");
//
//   // =================== Access by Index
//   print("Element at index 0: ${studentNames[0]}");
//   print("Index of 'Rahul': ${studentNames.indexOf('Rahul')}");
//   print("Contains 'Sneha': ${studentNames.contains('Sneha')}\n");
//
//   // ========================== Modification
//   studentNames.add("Amit");
//   print("After add: $studentNames");
//
//   studentNames.insert(1, "Pooja");
//   print("After insert at index 1: $studentNames");
//
//   studentNames.addAll(["Vikas", "Meena"]);
//   print("After addAll: $studentNames");
//
//   studentNames.remove("Rahul");
//   print("After remove('Rahul'): $studentNames");
//
//   studentNames.removeAt(0);
//   print("After removeAt(0): $studentNames");
//
//   studentNames.removeWhere((name) => name.startsWith("M"));
//   print("After removeWhere(start with M): $studentNames");
//
//   studentNames.retainWhere((name) => name.startsWith("S"));
//   print("After retainWhere(start with S): $studentNames");
//
//   studentNames.clear();
//   print("After clear(): $studentNames\n");
//
//   // ================================ Reset list for next examples
//   studentNames = ["Janvi", "Rahul", "Sneha", "Rahul"];
//
//   // ================ Transform & Iterate
//   studentNames.forEach((name) => print("Hello $name"));
//
//   var upperNames = studentNames.map((n) => n.toUpperCase()).toList();
//   print("map → Uppercase: $upperNames");
//
//   var filtered = studentNames.where((n) => n.startsWith("S")).toList();
//   print("where → Start with S: $filtered");
//
//   var totalLength = studentNames.map((n) => n.length).reduce((a, b) => a + b);
//   print("reduce → Total length of names: $totalLength");
//
//   var folded = studentNames.fold(100, (sum, n) => sum + n.length);
//   print("fold → Length sum with initial 100: $folded\n");
//
//   // 🔹 Order / Slicing
//   var sub = studentNames.sublist(1, 3);
//   print("sublist(1,3): $sub");
//
//   studentNames.sort();
//   print("sort(): $studentNames");
//
//   studentNames.shuffle();
//   print("shuffle(): $studentNames\n");
//
//   // ========================= Other Utilities
//   print("join with comma: ${studentNames.join(', ')}");
//   print("asMap: ${studentNames.asMap()}");
//   print("cast<String>: ${studentNames.cast<String>()}");
//   print("elementAt(2): ${studentNames.elementAt(2)}\n");
//
//   // ======================== Edge / Advanced
//   print("any(name starts with J): ${studentNames.any((n) => n.startsWith('J'))}");
//   print("every(name length > 3): ${studentNames.every((n) => n.length > 3)}");
//   print("take(2): ${studentNames.take(2).toList()}");
//   print("skip(2): ${studentNames.skip(2).toList()}");
//
//   print("takeWhile(not Rahul): ${studentNames.takeWhile((n) => n != 'Rahul').toList()}");
//   print("skipWhile(not Rahul): ${studentNames.skipWhile((n) => n != 'Rahul').toList()}\n");
//
//   // =============================Conversion
//   print("toSet (unique): ${studentNames.toSet()}");
//   print("toString: ${studentNames.toString()}");
//
//
//
//
//
// /// map ==========================
//   print("Map=============================================================================");
//     Map<String, dynamic> student = {
//       "name": "Janvi",
//       "rollNo": 25,
//       "class": "BCA"
//     };
//
//     // ============== Basic Properties
//     print("Map: $student");
//     print("Length: ${student.length}");
//     print("isEmpty: ${student.isEmpty}");
//     print("isNotEmpty: ${student.isNotEmpty}");
//     print("Keys: ${student.keys}");
//     print("Values: ${student.values}");
//     print("Entries: ${student.entries}\n");
//
//     // ============== Access & Search
//     print("Name: ${student["name"]}");
//     print("Contains key 'rollNo'? ${student.containsKey("rollNo")}");
//     print("Contains value 'BCA'? ${student.containsValue("BCA")}\n");
//
//     // =========== Modification
//     student["name"] = "Rahul"; // update
//     student.addAll({"city": "Delhi", "age": 21});
//     print("After addAll: $student");
//
//     student.remove("rollNo");
//     print("After remove('rollNo'): $student");
//
//     student.update("age", (val) => val + 1);
//     print("After update age: $student");
//
//     student.updateAll((key, val) => val.toString().toUpperCase());
//     print("After updateAll to uppercase: $student");
//
//     student.putIfAbsent("section", () => "A");
//     print("After putIfAbsent: $student\n");
//
//     // ========Iteration & Transform
//     student.forEach((k, v) => print("Key=$k, Value=$v"));
//
//     var newMap = student.map((k, v) => MapEntry(k, "Value: $v"));
//     print("Transformed Map: $newMap\n");
//
//     //================ Other utilities
//     print("Cast: ${student.cast<String, String>()}");
//     print("ToString: ${student.toString()}");
//
//   print("SET=============================================================================");
//
//     Set<int> numbers = {10, 20, 30, 40, 20};
//     print("Original Set: $numbers\n");
//
//     // ============ Basic Properties
//     print("Length: ${numbers.length}");
//     print("isEmpty: ${numbers.isEmpty}");
//     print("isNotEmpty: ${numbers.isNotEmpty}");
//     print("First: ${numbers.first}");
//     print("Last: ${numbers.last}\n");
//
//     // ============ Modification
//     numbers.add(50);
//     print("After add(50): $numbers");
//
//     numbers.addAll([60, 70]);
//     print("After addAll: $numbers");
//
//     numbers.remove(30);
//     print("After remove(30): $numbers");
//
//     numbers.removeWhere((n) => n % 2 == 0);
//     print("After removeWhere(even numbers): $numbers");
//
//     numbers = {10, 20, 30, 40, 50};
//     numbers.retainWhere((n) => n > 30);
//     print("After retainWhere(>30): $numbers");
//
//     numbers.clear();
//     print("After clear(): $numbers\n");
//
//     // ================ Reset set for operations
//     Set<int> a = {10, 20, 30};
//     Set<int> b = {30, 40, 50};
//
//     print("Set A: $a");
//     print("Set B: $b");
//     print("Union: ${a.union(b)}");
//     print("Intersection: ${a.intersection(b)}");
//     print("Difference A-B: ${a.difference(b)}\n");
//
//     // ==============Iteration & Transform
//     a.forEach((n) => print("Value: $n"));
//
//     var doubled = a.map((n) => n * 2).toSet();
//     print("map → doubled values: $doubled");
//
//     var filtered1= a.where((n) => n > 15).toSet();
//     print("where → values > 15: $filtered1");
//
//     var reduced = a.reduce((a, b) => a + b);
//     print("reduce → sum: $reduced");
//
//     var folded1 = a.fold(100, (sum, n) => sum + n);
//     print("fold → sum with initial 100: $folded1\n");
//
//     // ============ Other Utilities
//     print("Contains 20? ${a.contains(20)}");
//     print("toList: ${a.toList()}");
//     print("join with comma: ${a.join(', ')}");
//     print("toString: ${a.toString()}");
//
//
//
//
//
//
//
//
//
//
//     ///sealed classs================
//
//   final bloc = AuthBloc();
//
//
//   bloc.stream.listen((state) {
//     switch (state) {
//       case AuthLoading():
//         print("⏳ Logging in...");
//       case AuthSuccess s:
//         print("✅ Login Success! User: ${s.userId}");
//       case AuthError e:
//         print("❌ Login Failed: ${e.message}");
//     }
//   });
//
//   // Try login
//   bloc.add(AuthEvent("admin", "1234"));  // success
//   Future.delayed(Duration(seconds: 4), () {
//     bloc.add(AuthEvent("janvi", "wrong")); // error
//   });
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
