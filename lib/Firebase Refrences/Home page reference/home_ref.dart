import 'package:firebase_database/firebase_database.dart';

class HomeRef {
  final ref = FirebaseDatabase.instance.ref('TopCategories');
  final latestproductRef = FirebaseDatabase.instance.ref('Latestproduct');
  final dealsofthedayRef = FirebaseDatabase.instance.ref('Dealsoftheday');
}
