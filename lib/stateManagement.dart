// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class stateManagement extends StatefulWidget {
  const stateManagement({super.key});

  @override
  State<stateManagement> createState() => _stateManagementState();
}

class _stateManagementState extends State<stateManagement> {
  @override
  Widget build(BuildContext context) {
    //here are all the classes
    // return ChangeNotifierProviderAndConsumer();
    // return selectorr();
    // return ProviderOfContext();
    // return providerrrr1();
    return MultiProviderrrr();
  }
}

class ChangeNotifierProviderAndConsumer extends StatefulWidget {
  const ChangeNotifierProviderAndConsumer({super.key});

  @override
  State<ChangeNotifierProviderAndConsumer> createState() =>
      _ChangeNotifierProviderAndConsumerState();
}

class MyNames extends ChangeNotifier {
  String name = "nabil";
  changeName() {
    name = "nabil khawam jebokji";
    notifyListeners();
  }

  mynamechangemynameprovider() {
    name = "my name change my name provider";
    notifyListeners();
  }
}

class _ChangeNotifierProviderAndConsumerState
    extends State<ChangeNotifierProviderAndConsumer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyNames(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotifierProvider And Consumer'),
        ),
        body: Consumer<MyNames>(
          builder: (context, thisObject, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${thisObject.name}"),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          thisObject.changeName();
                        },
                        child: Text("Change Name"),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class selectorr extends StatefulWidget {
  const selectorr({super.key});

  @override
  State<selectorr> createState() => _selectorrState();
}

class selectorClass extends ChangeNotifier {
  String first = "nabil";
  String second = "jebokji";
  int number = 0;

  get selectorFirst => first;
  get selectorSecond => second;
  get selectorNumber => number;
  changeFirst() {
    first = "NABILO";
    notifyListeners();
  }

  changeSecond() {
    second = "KHAWAM";
    notifyListeners();
  }

  changeNumber() {
    number = number + 1;
    notifyListeners();
  }
}

class _selectorrState extends State<selectorr> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => selectorClass(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Selector'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<selectorClass, String>(
                    selector: (context, selectorfirst) =>
                        selectorfirst.selectorFirst,
                    builder: (context, selector, child) {
                      print(selector);
                      return Text("${selector}");
                    },
                  ),
                  SizedBox(height: 30),
                  Selector<selectorClass, String>(
                    selector: (context, selectorSecond) =>
                        selectorSecond.second,
                    builder: (context, selector, child) {
                      print(selector);

                      return Text("${selector}");
                    },
                  ),
                  SizedBox(height: 30),
                  Selector<selectorClass, int>(
                    selector: (context, selectornum) => selectornum.number,
                    builder: (context, selector, child) {
                      print(selector);
                      return Text("${selector}");
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<selectorClass>(
                    builder: (context, selector, child) {
                      return ElevatedButton(
                        onPressed: () {
                          selector.changeFirst();
                        },
                        child: Text("change first"),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<selectorClass>(
                    builder: (context, selector, child) {
                      return ElevatedButton(
                        onPressed: () {
                          selector.changeSecond();
                        },
                        child: Text("change second"),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<selectorClass>(
                    builder: (context, selector, child) {
                      return ElevatedButton(
                        onPressed: () {
                          selector.changeNumber();
                        },
                        child: Text("change number"),
                      );
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class ProviderOfContext extends StatefulWidget {
  const ProviderOfContext({super.key});

  @override
  State<ProviderOfContext> createState() => _ProviderOfContextState();
}

class ChangeMynames extends ChangeNotifier {
  String Name = "Nabil";

  changeName() {
    Name = "NABILOOOOOO";
    notifyListeners();
  }

  changemynamesprovider() {
    Name = "this is change my name providerr O.O";
    notifyListeners();
  }
}

class _ProviderOfContextState extends State<ProviderOfContext> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeMynames(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: ProviderOfContext2(),
      ),
    );
  }
}

class ProviderOfContext2 extends StatefulWidget {
  const ProviderOfContext2({super.key});

  @override
  State<ProviderOfContext2> createState() => _ProviderOfContext2State();
}

class _ProviderOfContext2State extends State<ProviderOfContext2> {
  @override
  Widget build(BuildContext context) {
    var mynames = Provider.of<ChangeMynames>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${mynames.Name}"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                mynames.changeName();
              },
              child: Text("change My Name"),
            ),
          ],
        ),
      ],
    );
  }
}

class providerrrr1 extends StatefulWidget {
  const providerrrr1({super.key});

  @override
  State<providerrrr1> createState() => _providerrrr1State();
}

class _providerrrr1State extends State<providerrrr1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NameModels(), child: Providerrrr());
  }
}

class Providerrrr extends StatefulWidget {
  const Providerrrr({super.key});

  @override
  State<Providerrrr> createState() => _ProviderrrrState();
}

class NameModels extends ChangeNotifier {
  String Namess = "Nabil";

  ChangeMyName() {
    Namess = "NABILOOOOO";
    notifyListeners();
  }

  ChangeMysurname() {
    Namess = "KHAWAM JEBOKJI";
    notifyListeners();
  }
}

class _ProviderrrrState extends State<Providerrrr> {
  @override
  Widget build(BuildContext context) {
    // var ProviderShortCut = Provider.of<NameModels>(context,
    //     listen: false); //this is the same as this //context.read<NameModels>().Namess;

    // var ProviderShortCut = Provider.of<NameModels>(context,
    // listen: true); //this is the same as this//context.watch<NameModels>().Namess;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${context.watch<NameModels>().Namess}"),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<NameModels>().ChangeMyName();
                },
                child: Text("change name"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<NameModels>().ChangeMysurname();
                },
                child: Text("change surname"),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class MultiProviderrrr extends StatefulWidget {
  const MultiProviderrrr({super.key});

  @override
  State<MultiProviderrrr> createState() => _MultiProviderrrrState();
}

class _MultiProviderrrrState extends State<MultiProviderrrr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChangeMynames()),
          ChangeNotifierProvider(create: (context) => MyNames()),
        ],
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ChangeMynames>(
                    builder: (context, changeMynames, child) {
                      return Text("${changeMynames.Name}");
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<MyNames>(
                    builder: (context, myNames, child) {
                      return Text("${myNames.name}");
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<MyNames>(
                    builder: (context, myNames, child) {
                      return ElevatedButton(
                        onPressed: () {
                          myNames.changeName();
                        },
                        child: Text("my Names"),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Consumer<ChangeMynames>(
                    builder: (context, changeMynames, child) {
                      return ElevatedButton(
                        onPressed: () {
                          changeMynames.changeName();
                        },
                        child: Text("change Myname "),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
