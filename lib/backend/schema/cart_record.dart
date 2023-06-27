import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "itemcount" field.
  int? _itemcount;
  int get itemcount => _itemcount ?? 0;
  bool hasItemcount() => _itemcount != null;

  // "isactive" field.
  bool? _isactive;
  bool get isactive => _isactive ?? false;
  bool hasIsactive() => _isactive != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "list_items" field.
  List<DocumentReference>? _listItems;
  List<DocumentReference> get listItems => _listItems ?? const [];
  bool hasListItems() => _listItems != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _itemcount = castToType<int>(snapshotData['itemcount']);
    _isactive = snapshotData['isactive'] as bool?;
    _amount = castToType<double>(snapshotData['amount']);
    _listItems = getDataList(snapshotData['list_items']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? creator,
  int? itemcount,
  bool? isactive,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'itemcount': itemcount,
      'isactive': isactive,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}
