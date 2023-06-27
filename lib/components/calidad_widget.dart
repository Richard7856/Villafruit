import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calidad_model.dart';
export 'calidad_model.dart';

class CalidadWidget extends StatefulWidget {
  const CalidadWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final DocumentReference? product;

  @override
  _CalidadWidgetState createState() => _CalidadWidgetState();
}

class _CalidadWidgetState extends State<CalidadWidget> {
  late CalidadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalidadModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProdutsRecord>(
      stream: ProdutsRecord.getDocument(widget.product!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitSquareCircle(
                color: Color(0xFF73B175),
                size: 50.0,
              ),
            ),
          );
        }
        final containerProdutsRecord = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 440.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Image.network(
                        containerProdutsRecord.image,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            containerProdutsRecord.name,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            'Precio: ${valueOrDefault<String>(
                              formatNumber(
                                containerProdutsRecord.price,
                                formatType: FormatType.custom,
                                format: '\$',
                                locale: '',
                              ),
                              '0',
                            )}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Kg totales agregados: ${valueOrDefault<String>(
                                functions
                                    .cantidad(
                                        valueOrDefault<int>(
                                          _model.countControllerValue1,
                                          0,
                                        ),
                                        valueOrDefault<int>(
                                          _model.countControllerValue2,
                                          0,
                                        ),
                                        valueOrDefault<int>(
                                          _model.countControllerValue3,
                                          0,
                                        ))
                                    .toString(),
                                '0',
                              )}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Subtotal: ${formatNumber(
                                functions.subt(
                                    valueOrDefault<int>(
                                      functions.cantidad(
                                          valueOrDefault<int>(
                                            _model.countControllerValue1,
                                            0,
                                          ),
                                          valueOrDefault<int>(
                                            _model.countControllerValue2,
                                            0,
                                          ),
                                          valueOrDefault<int>(
                                            _model.countControllerValue3,
                                            0,
                                          )),
                                      0,
                                    ),
                                    containerProdutsRecord.price),
                                formatType: FormatType.custom,
                                format: '\$',
                                locale: '',
                              )}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Verde',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              AutoSizeText(
                                'Precio: ${formatNumber(
                                  containerProdutsRecord.verde,
                                  formatType: FormatType.custom,
                                  format: '\$',
                                  locale: '',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              AutoSizeText(
                                'Para comer +5 días',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w200,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            width: 150.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 1.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: StreamBuilder<List<ItemselecionadoRecord>>(
                              stream: queryItemselecionadoRecord(
                                queryBuilder: (itemselecionadoRecord) =>
                                    itemselecionadoRecord.where('name',
                                        isEqualTo: containerProdutsRecord.name),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitSquareCircle(
                                        color: Color(0xFF73B175),
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ItemselecionadoRecord>
                                    countControllerItemselecionadoRecordList =
                                    snapshot.data!;
                                final countControllerItemselecionadoRecord =
                                    countControllerItemselecionadoRecordList
                                            .isNotEmpty
                                        ? countControllerItemselecionadoRecordList
                                            .first
                                        : null;
                                return Container(
                                  width: 150.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).error
                                          : Color(0xFFEEEEEE),
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : Color(0xFFEEEEEE),
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    count: _model.countControllerValue1 ??=
                                        countControllerItemselecionadoRecord !=
                                                null
                                            ? valueOrDefault<int>(
                                                countControllerItemselecionadoRecord!
                                                    .qtyverde,
                                                0,
                                              )
                                            : 0,
                                    updateCount: (count) => setState(() =>
                                        _model.countControllerValue1 = count),
                                    stepSize: 1,
                                    minimum: 0,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Medio',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          AutoSizeText(
                            'Precio: ${formatNumber(
                              containerProdutsRecord.price,
                              formatType: FormatType.custom,
                              format: '\$',
                              locale: '',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          AutoSizeText(
                            'Para comer 2-4 días después',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: 150.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: StreamBuilder<List<ItemselecionadoRecord>>(
                          stream: queryItemselecionadoRecord(
                            queryBuilder: (itemselecionadoRecord) =>
                                itemselecionadoRecord.where('name',
                                    isEqualTo: containerProdutsRecord.name),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitSquareCircle(
                                    color: Color(0xFF73B175),
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<ItemselecionadoRecord>
                                countControllerItemselecionadoRecordList =
                                snapshot.data!;
                            final countControllerItemselecionadoRecord =
                                countControllerItemselecionadoRecordList
                                        .isNotEmpty
                                    ? countControllerItemselecionadoRecordList
                                        .first
                                    : null;
                            return Container(
                              width: 150.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).error
                                      : Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                count: _model.countControllerValue2 ??=
                                    countControllerItemselecionadoRecord != null
                                        ? countControllerItemselecionadoRecord!
                                            .qtymedio
                                        : 0,
                                updateCount: (count) => setState(
                                    () => _model.countControllerValue2 = count),
                                stepSize: 1,
                                minimum: 0,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maduro',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          AutoSizeText(
                            'Precio: ${formatNumber(
                              containerProdutsRecord.maduro,
                              formatType: FormatType.custom,
                              format: '\$',
                              locale: '',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Para comer el día de entrega',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        width: 150.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: StreamBuilder<List<ItemselecionadoRecord>>(
                          stream: queryItemselecionadoRecord(
                            queryBuilder: (itemselecionadoRecord) =>
                                itemselecionadoRecord.where('name',
                                    isEqualTo: containerProdutsRecord.name),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitSquareCircle(
                                    color: Color(0xFF73B175),
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<ItemselecionadoRecord>
                                countControllerItemselecionadoRecordList =
                                snapshot.data!;
                            final countControllerItemselecionadoRecord =
                                countControllerItemselecionadoRecordList
                                        .isNotEmpty
                                    ? countControllerItemselecionadoRecordList
                                        .first
                                    : null;
                            return Container(
                              width: 150.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).error
                                      : Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                count: _model.countControllerValue3 ??=
                                    countControllerItemselecionadoRecord != null
                                        ? countControllerItemselecionadoRecord!
                                            .qtymaduro
                                        : 0,
                                updateCount: (count) => setState(
                                    () => _model.countControllerValue3 = count),
                                stepSize: 1,
                                minimum: 0,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: StreamBuilder<List<ItemselecionadoRecord>>(
                    stream: queryItemselecionadoRecord(
                      queryBuilder: (itemselecionadoRecord) =>
                          itemselecionadoRecord
                              .where('creator', isEqualTo: currentUserReference)
                              .where('name',
                                  isEqualTo: containerProdutsRecord.name),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitSquareCircle(
                              color: Color(0xFF73B175),
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ItemselecionadoRecord>
                          containerItemselecionadoRecordList = snapshot.data!;
                      final containerItemselecionadoRecord =
                          containerItemselecionadoRecordList.isNotEmpty
                              ? containerItemselecionadoRecordList.first
                              : null;
                      return Container(
                        width: 180.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: StreamBuilder<List<CartRecord>>(
                          stream: queryCartRecord(
                            queryBuilder: (cartRecord) => cartRecord
                                .where('creator',
                                    isEqualTo: currentUserReference)
                                .where('isactive', isEqualTo: true),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitSquareCircle(
                                    color: Color(0xFF73B175),
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<CartRecord> containerCartRecordList =
                                snapshot.data!;
                            final containerCartRecord =
                                containerCartRecordList.isNotEmpty
                                    ? containerCartRecordList.first
                                    : null;
                            return Container(
                              width: 180.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 0.0),
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (loggedIn) {
                                    if (containerCartRecord != null) {
                                      if (containerItemselecionadoRecord !=
                                          null) {
                                        var itemselecionadoRecordReference1 =
                                            ItemselecionadoRecord.collection
                                                .doc();
                                        await itemselecionadoRecordReference1
                                            .set(
                                                createItemselecionadoRecordData(
                                          name: containerProdutsRecord.name,
                                          price: containerProdutsRecord.price,
                                          quantity: functions.cantidad(
                                              _model.countControllerValue1!,
                                              _model.countControllerValue2!,
                                              _model.countControllerValue3!),
                                          item: widget.product,
                                          subtotal: functions.subt(
                                              functions.cantidad(
                                                  _model.countControllerValue1!,
                                                  _model.countControllerValue2!,
                                                  _model
                                                      .countControllerValue3!),
                                              containerProdutsRecord.price),
                                          image: containerProdutsRecord.image,
                                          description: containerProdutsRecord
                                              .description,
                                          qtymaduro:
                                              _model.countControllerValue3,
                                          qtyverde:
                                              _model.countControllerValue1,
                                          qtymedio:
                                              _model.countControllerValue2,
                                          color: containerProdutsRecord.color,
                                          creator: currentUserReference,
                                        ));
                                        _model.add23 = ItemselecionadoRecord
                                            .getDocumentFromData(
                                                createItemselecionadoRecordData(
                                                  name: containerProdutsRecord
                                                      .name,
                                                  price: containerProdutsRecord
                                                      .price,
                                                  quantity: functions.cantidad(
                                                      _model
                                                          .countControllerValue1!,
                                                      _model
                                                          .countControllerValue2!,
                                                      _model
                                                          .countControllerValue3!),
                                                  item: widget.product,
                                                  subtotal: functions.subt(
                                                      functions.cantidad(
                                                          _model
                                                              .countControllerValue1!,
                                                          _model
                                                              .countControllerValue2!,
                                                          _model
                                                              .countControllerValue3!),
                                                      containerProdutsRecord
                                                          .price),
                                                  image: containerProdutsRecord
                                                      .image,
                                                  description:
                                                      containerProdutsRecord
                                                          .description,
                                                  qtymaduro: _model
                                                      .countControllerValue3,
                                                  qtyverde: _model
                                                      .countControllerValue1,
                                                  qtymedio: _model
                                                      .countControllerValue2,
                                                  color: containerProdutsRecord
                                                      .color,
                                                  creator: currentUserReference,
                                                ),
                                                itemselecionadoRecordReference1);
                                        _shouldSetState = true;

                                        await containerCartRecord!.reference
                                            .update({
                                          ...createCartRecordData(
                                            creator: currentUserReference,
                                            isactive: true,
                                          ),
                                          'itemcount': FieldValue.increment(
                                              containerItemselecionadoRecord!
                                                  .quantity),
                                          'amount': FieldValue.increment(
                                              containerItemselecionadoRecord!
                                                  .subtotal),
                                          'list_items': FieldValue.arrayUnion(
                                              [_model.add23!.reference]),
                                        });
                                      } else {
                                        var itemselecionadoRecordReference2 =
                                            ItemselecionadoRecord.collection
                                                .doc();
                                        await itemselecionadoRecordReference2
                                            .set(
                                                createItemselecionadoRecordData(
                                          name: containerProdutsRecord.name,
                                          price: containerProdutsRecord.price,
                                          quantity: functions.cantidad(
                                              _model.countControllerValue1!,
                                              _model.countControllerValue2!,
                                              _model.countControllerValue3!),
                                          item: widget.product,
                                          subtotal: functions.subt(
                                              functions.cantidad(
                                                  _model.countControllerValue1!,
                                                  _model.countControllerValue2!,
                                                  _model
                                                      .countControllerValue3!),
                                              containerProdutsRecord.price),
                                          image: containerProdutsRecord.image,
                                          description: containerProdutsRecord
                                              .description,
                                          qtymaduro:
                                              _model.countControllerValue3,
                                          qtyverde:
                                              _model.countControllerValue1,
                                          qtymedio:
                                              _model.countControllerValue2,
                                          color: containerProdutsRecord.color,
                                          creator: currentUserReference,
                                        ));
                                        _model.add = ItemselecionadoRecord
                                            .getDocumentFromData(
                                                createItemselecionadoRecordData(
                                                  name: containerProdutsRecord
                                                      .name,
                                                  price: containerProdutsRecord
                                                      .price,
                                                  quantity: functions.cantidad(
                                                      _model
                                                          .countControllerValue1!,
                                                      _model
                                                          .countControllerValue2!,
                                                      _model
                                                          .countControllerValue3!),
                                                  item: widget.product,
                                                  subtotal: functions.subt(
                                                      functions.cantidad(
                                                          _model
                                                              .countControllerValue1!,
                                                          _model
                                                              .countControllerValue2!,
                                                          _model
                                                              .countControllerValue3!),
                                                      containerProdutsRecord
                                                          .price),
                                                  image: containerProdutsRecord
                                                      .image,
                                                  description:
                                                      containerProdutsRecord
                                                          .description,
                                                  qtymaduro: _model
                                                      .countControllerValue3,
                                                  qtyverde: _model
                                                      .countControllerValue1,
                                                  qtymedio: _model
                                                      .countControllerValue2,
                                                  color: containerProdutsRecord
                                                      .color,
                                                  creator: currentUserReference,
                                                ),
                                                itemselecionadoRecordReference2);
                                        _shouldSetState = true;

                                        await containerCartRecord!.reference
                                            .update({
                                          ...createCartRecordData(
                                            creator: currentUserReference,
                                            isactive: true,
                                          ),
                                          'list_items': FieldValue.arrayUnion(
                                              [_model.add!.reference]),
                                          'itemcount': FieldValue.increment(
                                              functions.cantidad(
                                                  _model.countControllerValue1!,
                                                  _model.countControllerValue2!,
                                                  _model
                                                      .countControllerValue3!)),
                                          'amount': FieldValue.increment(
                                              _model.add!.subtotal),
                                        });
                                      }
                                    } else {
                                      var itemselecionadoRecordReference3 =
                                          ItemselecionadoRecord.collection
                                              .doc();
                                      await itemselecionadoRecordReference3
                                          .set(createItemselecionadoRecordData(
                                        name: containerProdutsRecord.name,
                                        price: containerProdutsRecord.price,
                                        quantity: functions.cantidad(
                                            _model.countControllerValue1!,
                                            _model.countControllerValue2!,
                                            _model.countControllerValue3!),
                                        item: widget.product,
                                        subtotal: functions.subt(
                                            functions.cantidad(
                                                _model.countControllerValue1!,
                                                _model.countControllerValue2!,
                                                _model.countControllerValue3!),
                                            containerProdutsRecord.price),
                                        image: containerProdutsRecord.image,
                                        description:
                                            containerProdutsRecord.description,
                                        qtymaduro: _model.countControllerValue3,
                                        qtyverde: _model.countControllerValue1,
                                        qtymedio: _model.countControllerValue2,
                                        color: containerProdutsRecord.color,
                                        creator: currentUserReference,
                                      ));
                                      _model.create = ItemselecionadoRecord
                                          .getDocumentFromData(
                                              createItemselecionadoRecordData(
                                                name:
                                                    containerProdutsRecord.name,
                                                price: containerProdutsRecord
                                                    .price,
                                                quantity: functions.cantidad(
                                                    _model
                                                        .countControllerValue1!,
                                                    _model
                                                        .countControllerValue2!,
                                                    _model
                                                        .countControllerValue3!),
                                                item: widget.product,
                                                subtotal: functions.subt(
                                                    functions.cantidad(
                                                        _model
                                                            .countControllerValue1!,
                                                        _model
                                                            .countControllerValue2!,
                                                        _model
                                                            .countControllerValue3!),
                                                    containerProdutsRecord
                                                        .price),
                                                image: containerProdutsRecord
                                                    .image,
                                                description:
                                                    containerProdutsRecord
                                                        .description,
                                                qtymaduro: _model
                                                    .countControllerValue3,
                                                qtyverde: _model
                                                    .countControllerValue1,
                                                qtymedio: _model
                                                    .countControllerValue2,
                                                color: containerProdutsRecord
                                                    .color,
                                                creator: currentUserReference,
                                              ),
                                              itemselecionadoRecordReference3);
                                      _shouldSetState = true;

                                      await CartRecord.collection.doc().set({
                                        ...createCartRecordData(
                                          creator: currentUserReference,
                                          itemcount: functions.cantidad(
                                              _model.countControllerValue1!,
                                              _model.countControllerValue2!,
                                              _model.countControllerValue3!),
                                          isactive: true,
                                          amount: functions.subt(
                                              functions.cantidad(
                                                  _model.countControllerValue1!,
                                                  _model.countControllerValue2!,
                                                  _model
                                                      .countControllerValue3!),
                                              containerProdutsRecord.price),
                                        ),
                                        'list_items': [
                                          _model.create!.reference
                                        ],
                                      });
                                    }

                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Agregado con exito'),
                                          content: Text(
                                              'El producto se agrego con exito'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.pop(context);
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('No se a iniciado sesion'),
                                          content: Text(
                                              'Ocupas iniciar sesion para poder continuar'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child:
                                                  Text('Ir a iniciar sesion '),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed('Login');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Agregar al carrito',
                                options: FFButtonOptions(
                                  width: 180.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
