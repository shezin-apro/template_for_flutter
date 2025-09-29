import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/injection_container.dart' as di;
import 'package:template_for_flutter/core/theme/app_theme.dart';
import 'package:template_for_flutter/features/example_feature/presentation/pages/example_page.dart';
import 'package:template_for_flutter/features/example_feature/presentation/provider/example_provider.dart';

import 'features/example_feature/domain/usecases/example_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExampleProvider(di.sl<GetExample>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture Template',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const ExamplePage(),
      ),
    );
  }
}
