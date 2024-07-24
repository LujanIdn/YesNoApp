import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
//import 'config/theme/app_theme.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: AppTheme(selectedColor: 2).theme(),
          title: 'Yes no App',
          home: ChatScreen()),
    );
  }
}
