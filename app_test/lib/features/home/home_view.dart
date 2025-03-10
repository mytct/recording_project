import 'package:app_core/ui/core_stateless.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomeView extends CoreStateless {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Container
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            "Header Container",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),

        // ListView inside Expanded to take the remaining space
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Replace with your list length
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.audio_file_rounded),
                title: Text("Item ${index + 1}"),
                subtitle: Text("Subtitle ${index + 1}"),
                trailing: const Icon(Icons.play_circle_outline_rounded),
              );
            },
          ),
        ),
      ],
    );
  }
}
