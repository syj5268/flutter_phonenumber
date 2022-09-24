import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contact Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListTile> contacts = [
    const ListTile(leading: FlutterLogo(), title: Text('가나다')),
    const ListTile(leading: FlutterLogo(), title: Text('라마바')),
    const ListTile(leading: FlutterLogo(), title: Text('사아자')),
    const ListTile(leading: FlutterLogo(), title: Text('카타파')),
    const ListTile(leading: FlutterLogo(), title: Text('하하하')),
  ];

  addContact(ListTile newname) {
    setState(() {
      contacts.add(newname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Container(child: contacts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return inputDialog(addcon: addContact);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class inputDialog extends StatelessWidget {
  //inputDialog를 custom widget이라 부른다. widget=함수
  inputDialog({
    super.key,
    required this.addcon, //중괄호 안에 넣어주었기 때문에 위에서 'count: 00'
  });

  final addcon;
  final controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      children: [
        TextField(
            controller: controller1,
            //input 가능한 창
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '텍스트를 입력해주세요',
            )),
        Row(
          children: [
            TextButton(
              onPressed: () {
                addcon(ListTile(
                  leading: FlutterLogo(),
                  title: Text(controller1.text),
                ));
              },
              child: Text('확인'),
            ),
            TextButton(onPressed: () {}, child: Text('취소'))
          ],
        ),
      ],
    ));
  }
}



//부모한테 state 설정권한을 주어야함