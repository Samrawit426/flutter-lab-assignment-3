import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab_assignment_3/app_router.dart';
import 'package:flutter_lab_assignment_3/services/api_service.dart';

void main() {
  testWidgets('App loads and displays Albums list', (WidgetTester tester) async {
    final apiService = ApiService();
    final appRouter = AppRouter(apiService);

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: appRouter.router,
      ),
    );

    await tester.pumpAndSettle(); // wait for async stuff to settle

    expect(find.text('Albums'), findsOneWidget); // adjust as per your UI
  });
}
