import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutsRecord extends FirestoreRecord {
  ProdutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "maduro" field.
  double? _maduro;
  double get maduro => _maduro ?? 0.0;
  bool hasMaduro() => _maduro != null;

  // "verde" field.
  double? _verde;
  double get verde => _verde ?? 0.0;
  bool hasVerde() => _verde != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _image = snapshotData['image'] as String?;
    _maduro = castToType<double>(snapshotData['maduro']);
    _verde = castToType<double>(snapshotData['verde']);
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produts');

  static Stream<ProdutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutsRecord.fromSnapshot(s));

  static Future<ProdutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutsRecord.fromSnapshot(s));

  static ProdutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutsRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  int? quantity,
  String? image,
  double? maduro,
  double? verde,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'quantity': quantity,
      'image': image,
      'maduro': maduro,
      'verde': verde,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}
