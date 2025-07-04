import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategorysRecord extends FirestoreRecord {
  CategorysRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "listsubcategorys" field.
  String? _listsubcategorys;
  String get listsubcategorys => _listsubcategorys ?? '';
  bool hasListsubcategorys() => _listsubcategorys != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _listsubcategorys = snapshotData['listsubcategorys'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categorys');

  static Stream<CategorysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategorysRecord.fromSnapshot(s));

  static Future<CategorysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategorysRecord.fromSnapshot(s));

  static CategorysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategorysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategorysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategorysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategorysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategorysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategorysRecordData({
  String? category,
  String? listsubcategorys,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'listsubcategorys': listsubcategorys,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategorysRecordDocumentEquality implements Equality<CategorysRecord> {
  const CategorysRecordDocumentEquality();

  @override
  bool equals(CategorysRecord? e1, CategorysRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.listsubcategorys == e2?.listsubcategorys;
  }

  @override
  int hash(CategorysRecord? e) =>
      const ListEquality().hash([e?.category, e?.listsubcategorys]);

  @override
  bool isValidKey(Object? o) => o is CategorysRecord;
}
