import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorePage(isLoggedIn: isLoggedIn, login: login),
      routes: {
        '/login': (context) => LoginPage(login: login),
        '/home': (context) => StorePage(isLoggedIn: isLoggedIn, login: login),
        '/woman': (context) => WomanPage(isLoggedIn: isLoggedIn),
        '/man': (context) => ManPage(isLoggedIn: isLoggedIn),
        '/kids': (context) => KidsPage(isLoggedIn: isLoggedIn),
        '/beauty': (context) => BeautyPage(isLoggedIn: isLoggedIn),
        '/basket': (context) => BasketPage(isLoggedIn: isLoggedIn),
      },
    );
  }
}

class StorePage extends StatelessWidget {
  final bool isLoggedIn;
  final VoidCallback login;

  StorePage({required this.isLoggedIn, required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "ZARA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/basket');
                        },
                        child: Text("바스킷백"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/woman');
                    },
                    child: Text("WOMAN", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/man');
                    },
                    child: Text("MAN", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/kids');
                    },
                    child: Text("KIDS", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/beauty');
                    },
                    child: Text("BEAUTY", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset("assets/zara1.jpg", fit: BoxFit.cover),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Image.asset("assets/zara2.jpg", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final VoidCallback login;

  LoginPage({required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text("고객님의 계정에 엑세스하세요"),
              SizedBox(height: 20),
              CustomForm(login: login),
            ],
          ),
        ),
      ),
    );
  }
}

class BasketPage extends StatelessWidget {
  final bool isLoggedIn;

  BasketPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    var items = List<String>.generate(20, (index) => "ZARA(${index + 1})");

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      subtitle: Text("₩ 59,900"),
                      trailing: Icon(Icons.shopping_cart),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${items[index]} 선택됨")),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class WomanPage extends StatelessWidget {
  final bool isLoggedIn;

  WomanPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/w_clothes1.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("자수 미디 원피스 ZW COLLECTION"),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/w_clothes2.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("CREASED-EFFECT MIDI SKIRT"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManPage extends StatelessWidget {
  final bool isLoggedIn;

  ManPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/m_clothes1.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("BERMUDA DENIM BAGGY FIT"),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/m_clothes2.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("BERMUDA DENIM BAGGY FIT"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KidsPage extends StatelessWidget {
  final bool isLoggedIn;

  KidsPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/k_clothes1.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("리본 프릴 티셔츠"),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/k_clothes2.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("썬 자수 타월 폴로셔츠"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BeautyPage extends StatelessWidget {
  final bool isLoggedIn;

  BeautyPage({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "ZARA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("로그인"),
                        ),
                      SizedBox(width: 10),
                      Text("도움말"),
                      SizedBox(width: 10),
                      Text("바스킷백"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/b_beauty1.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("RED TEMPTATION 80ML"),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset("assets/b_beauty2.jpg", fit: BoxFit.cover),
                          ),
                          SizedBox(height: 5),
                          Text("립 오일"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  final VoidCallback login;

  CustomForm({required this.login});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: login,
          child: Text('Login'),
        ),
      ],
    );
  }
}
