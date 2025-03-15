import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tax_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TaxModel>> getTaxInfo() async {
    QuerySnapshot snapshot = await _firestore.collection('tax_info').get();
    return snapshot.docs.map((doc) => TaxModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }
}