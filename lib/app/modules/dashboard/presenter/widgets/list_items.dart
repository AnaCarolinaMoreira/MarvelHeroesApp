import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: const Text('ddd'),
              subtitle: const Text('ddd'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_right,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
