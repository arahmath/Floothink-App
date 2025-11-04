import 'package:flutter/material.dart';

// Dummy data activity model
class Activity {
  String author;
  String timestamp;
  DateTime date;
  String content;
  Duration duration;
  String avatarPath; // pakai asset path

  Activity({
    required this.author,
    required this.timestamp,
    required this.date,
    required this.content,
    required this.duration,
    required this.avatarPath,
  });
}

class DetailTaskPage extends StatefulWidget {
  const DetailTaskPage({super.key});

  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  final List<Activity> activities = [
    Activity(
      author: "Rahmat",
      timestamp: "11:08 AM",
      date: DateTime(2025, 11, 4),
      content:
          "Lanjut Tutorial Flutter\n • Date Format\n • Custom AppBar\n • Custom TabBar",
      duration: const Duration(minutes: 45),
      avatarPath: "assets/images/user1.png",
    ),
    Activity(
      author: "Rahmat Intern",
      timestamp: "10:08 AM",
      date: DateTime(2025, 11, 4),
      content:
          "Mempelajari Management State\n • setState() dan kapan menggunakannya\n • InheritedWidget & Provider dasar",
      duration: const Duration(minutes: 60),
      avatarPath: "assets/images/user1.png",
    ),
  ];

  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  void _showAddActivityDialog() {
    _activityController.clear();
    _durationController.clear();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Activity"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _activityController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Activity Detail",
                  border: OutlineInputBorder(),
                  hintText: "Write your activity here",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Duration (minutes)",
                  border: OutlineInputBorder(),
                  hintText: "Minutes",
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final content = _activityController.text.trim();
              final durationMinutes =
                  int.tryParse(_durationController.text.trim()) ?? 0;

              if (content.isNotEmpty && durationMinutes > 0) {
                setState(() {
                  activities.insert(
                    0,
                    Activity(
                      author: "Rahmat",
                      timestamp: TimeOfDay.now().format(context),
                      date: DateTime.now(),
                      content: content,
                      duration: Duration(minutes: durationMinutes),
                      avatarPath: "assets/images/user1.png", // asset avatar
                    ),
                  );
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _activityController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFFAF6EB);
    const taskCardColor = Color(0xFFFFF5CC);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Detail Task"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TASK CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: taskCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAD98E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "IT General",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.brown,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Daily Routine",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Internship",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage("assets/images/user1.png"),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'Req By: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Andri',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Created: 03/11/2025",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const Text("Assign To:", style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 6),
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage("assets/images/user1.png"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Activity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ActivityCard(activity: activities[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFAC95E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: _showAddActivityDialog,
          child: const Text(
            "+ Add Activity",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  String formatDate(DateTime date) =>
      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD6E7FF),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(activity.avatarPath),
              ),
              const SizedBox(width: 8),
              Text(activity.author, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 6),
              Text("(${formatDate(activity.date)})", style: const TextStyle(color: Colors.grey)),
              const Spacer(),
              Icon(Icons.more_vert, size: 18)
            ],
          ),
          const SizedBox(height: 8),
          Text(activity.content, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
