import 'package:floothink_app/theme/app_pallate.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  final String status;
  const TaskPage({super.key, required this.status});

  List<Map<String, dynamic>> getTasks() {
    return [
      {
        "category": "Design",
        "title": "Create Mockup Landing Page",
        "subtitle": "Astra Satu Indonesia",
        "avatarUrl": "https://i.pravatar.cc/150",
        "dueDate": "12 Feb",
        "duration": "~1h",
        "progress": status == "Complete" ? 100 : (status == "Pending" ? 20 : 60),
        "status": status,
      },
      {
        "category": "Development",
        "title": "Fix Navigation Bug",
        "subtitle": "Mobile App Revamp",
        "avatarUrl": "https://i.pravatar.cc/150?img=5",
        "dueDate": "10 Feb",
        "duration": "~2h",
        "progress": status == "Complete" ? 100 : (status == "Pending" ? 40 : 80),
        "status": status,
      },
      {
        "category": "Backend",
        "title": "Update API Endpoints",
        "subtitle": "Backend Improvement",
        "avatarUrl": "https://i.pravatar.cc/150?img=15",
        "dueDate": "18 Feb",
        "duration": "~3h",
        "progress": status == "Complete" ? 100 : (status == "Pending" ? 10 : 50),
        "status": status,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final tasks = getTasks();

    return Scaffold(
      backgroundColor: AppPallate.cream,
      appBar: AppBar(
        backgroundColor: AppPallate.cream,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: AppPallate.blueA),
        ),
        title: Text(
          "$status Task",
          style: const TextStyle(color: AppPallate.blueA),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppPallate.cream,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // LEFT SIDE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Tag
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          task["category"],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        task["title"],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),

                      Text(
                        task["subtitle"],
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),

                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(task["avatarUrl"]),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.red, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            "Due ${task["dueDate"]}",
                            style: const TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // RIGHT SIDE
                Column(
                  children: [
                    // Duration Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppPallate.hitam,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        task["duration"],
                        style: const TextStyle(color: AppPallate.colorprimary, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Progress Circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value: task["progress"] / 100,
                            strokeWidth: 4,
                            valueColor: AlwaysStoppedAnimation(
                              task["progress"] == 100
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                            backgroundColor: Colors.green.shade100,
                          ),
                        ),
                        Text(
                          "${task["progress"]}%",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: task["progress"] == 100
                                ? Colors.green
                                : Colors.orange.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Text(
                      task["status"],
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: status == "Pending" ? Colors.redAccent : Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
