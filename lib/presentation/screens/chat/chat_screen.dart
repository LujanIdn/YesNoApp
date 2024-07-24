import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/message_field_box.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        toolbarHeight: 70,
        leading: const Row(
          children: [
            SizedBox(
              width: 16,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg'),
            )
          ],
        ),
        title: const Text(
          'User',
        ),
        centerTitle: false,
      ),
      backgroundColor: Color.fromARGB(255, 243, 235, 235),
      body: _Chatview(),
    );
  }
}

//  child: ,

class _Chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messagelist.length,
              itemBuilder: (context, index) {
                final mensaje = chatProvider.messagelist[index];
                return (mensaje.fromWho == FromWho.hers)
                    ? HerMessageBubble(mensaje: mensaje)
                    : MyMessageBubble(message: mensaje);
              },
            )),
            //caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
