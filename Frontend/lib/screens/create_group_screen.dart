import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/providers/my_group.dart';
import 'package:hawir/widgets/bottom_navbar.dart';
import 'package:hawir/widgets/group_tab.dart';
import 'package:intl/intl.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key, required this.ref});
  final WidgetRef ref;
  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart
          ? (_startDate ?? DateTime.now())
          : (_endDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStart ? _startDate : _endDate)) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_endDate != null && _startDate!.isAfter(_endDate!)) {
            _endDate = null; // Reset end date if it is before the start date
          }
        } else {
          _endDate = picked;
        }
      });
    }

    @override
    void dispose() {
      titleController.dispose();
      descriptionController.dispose();
      priceController.dispose();
      tagsController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.ref.watch(groupTabIndexProvider);
    print('Hello');
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context, widget.ref),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                groupTab(context, widget.ref),
                TextField(
                  controller: titleController,
                  onTapOutside: (enter) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Group Name',
                    hintText: 'Group Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  onTapOutside: (enter) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Group Name',
                    hintText: 'Budget',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tagsController,
                  onTapOutside: (enter) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Group Name',
                    hintText: 'Tags: #tag1 #tag2',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(158, 158, 158, 1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () => _selectDate(context, true),
                        child: Text(
                          _startDate == null
                              ? 'Select Start Date'
                              : DateFormat('y-MM-dd').format(_startDate!),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(158, 158, 158, 1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () => _selectDate(context, false),
                        child: Text(
                          _endDate == null
                              ? 'Select End Date'
                              : DateFormat('y-MM-dd').format(_endDate!),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 100,
                  child: TextField(
                    controller: descriptionController,
                    onTapOutside: (enter) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'Group Name',
                      hintText: 'Description',
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // widget.ref.read(myGroupProvider.notifier).addGroup(
                    //       Group(
                    //         title: titleController.text,
                    //         id: widget.ref
                    //                 .read(myGroupProvider.notifier)
                    //                 .listLen() +
                    //             1,
                    //         startDate: _startDate!,
                    //         endDate: _endDate!,
                    //         memebers: [1],
                    //         description: descriptionController.text,
                    //         tags: [tagsController.text],
                    //         prices: double.parse(priceController.text),
                    //       ),
                    //     );
                    // widget.ref.read(groupTabIndexProvider.notifier).setIndex(1);
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 10, 26, 1),
                      minimumSize: const Size(250, 50),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  iconAlignment: IconAlignment.end,
                  child: const Text('Create',
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
