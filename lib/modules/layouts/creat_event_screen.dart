import 'package:events/core/app_colors.dart';
import 'package:events/modules/firebase_utils/firebase_utils.dart';
import 'package:events/modules/models/event_model.dart';
import 'package:events/modules/widgets/customBtn.dart';
import 'package:events/modules/widgets/event_tab.dart';
import 'package:flutter/material.dart';

class CreatEventScreen extends StatefulWidget {
  const CreatEventScreen({super.key});

  @override
  State<CreatEventScreen> createState() => _CreatEventScreenState();
}

class _CreatEventScreenState extends State<CreatEventScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<String> tabsName = [
    "sport",
    "birthday",
    "meeting",
    "holiday",
    "gaming",
    "work shop",
    "book club",
    "exhibition",
    "eating",
  ];

  List<String> images = [
    "assets/images/sport_image.png",
    "assets/images/birthday_image.png",
    "assets/images/meeting_image.png",
    "assets/images/holiday_image.png",
    "assets/images/gaming.png",
    "assets/images/work_shop.png",
    "assets/images/Book Club.png",
    "assets/images/exhibition.png",
    "assets/images/eating.png"
  ];

  int selectedIndex = 0;
  String selectedImage = "";
  String selectedEventName = "";

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? formatTime;

  @override
  void initState() {
    super.initState();
    selectedImage = images[selectedIndex];
    selectedEventName = tabsName[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Event",
          style: TextStyle(
            fontSize: 30,
            color: AppColors.prime,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.prime),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(selectedImage),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            selectedEventName = tabsName[index];
                            selectedImage = images[index];
                          });
                        },
                        child: EventTab(
                          categoryName: tabsName[index],
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: tabsName.length,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Text(
                      "Title",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "please Enter Event Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Event Title",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descController,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: 5,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "please Enter Event Description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Event Description",
                    // contentPadding: EdgeInsets.symmetric(vertical: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.date_range_sharp),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Event Date",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: chooseDate,
                        child: selectedDate == null
                            ? Text(
                                "Choose Date",
                                style: TextStyle(
                                    color: AppColors.prime, fontSize: 20),
                              )
                            : Text(
                                "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                style: TextStyle(
                                    color: AppColors.prime, fontSize: 20),
                              ))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Event Time",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: chooseTime,
                        child: selectedTime == null
                            ? Text(
                                "Choose Time",
                                style: TextStyle(
                                    color: AppColors.prime, fontSize: 20),
                              )
                            : Text(
                                "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')} ${selectedTime!.period.name}",
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.prime),
                              ))
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(onTap: addEvent, child: CustomBtn(text: "Add Event")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose an event date')),
        );
        return;
      }

      if (selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose an event time')),
        );
        return;
      }
      Event event = Event(
        image: selectedImage,
        eventName: selectedEventName,
        title: titleController.text,
        description: descController.text,
        dateTime: selectedDate!,
        time: formatTime!,
      );
      FirebaseUtils.addEventToFireStore(event)
          .timeout(Duration(milliseconds: 500),onTimeout: () {
            print("Event Added Successfully");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Events Added Successfully")));
           Navigator.pop(context);
          },);
    }
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    setState(() {
      selectedDate = chooseDate;
    });
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      selectedTime = chooseTime;
      formatTime = selectedTime!.format(context);
    });
  }
}
