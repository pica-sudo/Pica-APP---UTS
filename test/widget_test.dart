import 'package:flutter_test/flutter_test.dart';
import 'package:pica_app/main.dart';

void main() {
  testWidgets('PICA APP loads login page', (WidgetTester tester) async {
    await tester.pumpWidget(PicaApp()); // panggil app kamu

    // cek apakah halaman login muncul
    expect(find.text('PICA APP Login'), findsOneWidget);
  });
}
