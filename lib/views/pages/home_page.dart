import 'package:flutter/material.dart';
import 'package:inherited_widget/controllers/state_widget.dart';
import 'package:inherited_widget/views/pages/change_color_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateWidget = StateInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.yellow,
        title: const Text('Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              stateWidget.state.counter.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeColorPage())),
                  icon: const Icon(Icons.color_lens),
                  label: const Text('Change Primary Swatch'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
       onPressed: (){
            stateWidget.addCounter();
       },
        child: const Icon(Icons.add),
      ),
    );
  }
}