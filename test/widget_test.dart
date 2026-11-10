import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_ain_car_recovery/main.dart';

void main() {
  testWidgets('Recovery app home screen loads', (tester) async {
    await tester.pumpWidget(const RecoveryApp());
    expect(find.text('AL AIN CAR RECOVERY'), findsWidgets);
    expect(find.text('BOOK RECOVERY NOW'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsWidgets);
  });
}
