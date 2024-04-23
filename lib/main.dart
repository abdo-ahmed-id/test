import 'package:flutter/material.dart';
import 'package:test_cli2/form_file_picker/form_builder_file_picker.dart';
import 'package:test_cli2/form_file_picker/src/form_builder_file_picker.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            controller.previousPage(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  FormBuilderFilePicker(
                    name: 'project_brochure',

                    // initialValue:
                    //     controller.bruchure != null ? [controller.bruchure!] : null,

                    typeSelectors: [
                      TypeSelector(
                          type: FileType.image,
                          selector: Row(
                            children: [
                              Icon(Icons.add),
                              Text(
                                'choose_file',
                              ),
                            ],
                          ))
                    ],
                    decoration: InputDecoration(),
                  ),
                  FormBuilderFilePicker(
                    name: 'project_brochure',

                    // initialValue:
                    //     controller.bruchure != null ? [controller.bruchure!] : null,

                    typeSelectors: [
                      TypeSelector(
                          type: FileType.image,
                          selector: Row(
                            children: [
                              Icon(Icons.add),
                              Text(
                                'choose_file Page 2',
                              ),
                            ],
                          ))
                    ],
                    decoration: InputDecoration(),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.ease);
                },
                child: Text('next'))
          ],
        ),
      ),
    );
  }
}
