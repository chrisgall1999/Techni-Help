import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PdfFilesRecord extends FirestoreRecord {
  PdfFilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "numrerpot" field.
  int? _numrerpot;
  int get numrerpot => _numrerpot ?? 0;
  bool hasNumrerpot() => _numrerpot != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "subcategory" field.
  String? _subcategory;
  String get subcategory => _subcategory ?? '';
  bool hasSubcategory() => _subcategory != null;

  // "seconsubcategory" field.
  String? _seconsubcategory;
  String get seconsubcategory => _seconsubcategory ?? '';
  bool hasSeconsubcategory() => _seconsubcategory != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _numrerpot = castToType<int>(snapshotData['numrerpot']);
    _category = snapshotData['category'] as String?;
    _subcategory = snapshotData['subcategory'] as String?;
    _seconsubcategory = snapshotData['seconsubcategory'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pdf_files');

  static Stream<PdfFilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PdfFilesRecord.fromSnapshot(s));

  static Future<PdfFilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PdfFilesRecord.fromSnapshot(s));

  static PdfFilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PdfFilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PdfFilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PdfFilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PdfFilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PdfFilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPdfFilesRecordData({
  String? name,
  String? url,
  DateTime? timestamp,
  int? numrerpot,
  String? category,
  String? subcategory,
  String? seconsubcategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'url': url,
      'timestamp': timestamp,
      'numrerpot': numrerpot,
      'category': category,
      'subcategory': subcategory,
      'seconsubcategory': seconsubcategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class PdfFilesRecordDocumentEquality implements Equality<PdfFilesRecord> {
  const PdfFilesRecordDocumentEquality();

  @override
  bool equals(PdfFilesRecord? e1, PdfFilesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.url == e2?.url &&
        e1?.timestamp == e2?.timestamp &&
        e1?.numrerpot == e2?.numrerpot &&
        e1?.category == e2?.category &&
        e1?.subcategory == e2?.subcategory &&
        e1?.seconsubcategory == e2?.seconsubcategory;
  }

  @override
  int hash(PdfFilesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.url,
        e?.timestamp,
        e?.numrerpot,
        e?.category,
        e?.subcategory,
        e?.seconsubcategory
      ]);

  @override
  bool isValidKey(Object? o) => o is PdfFilesRecord;
}
