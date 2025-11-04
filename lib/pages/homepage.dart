import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:floothink_app/theme/app_pallate.dart';
import 'package:floothink_app/pages/task_page.dart';
import 'package:floothink_app/pages/employe_page.dart';

final List<Map<String, String>> userList = [
  {"name": "Rahmat", "role": "IT Internship"},
  {"name": "Riza", "role": "UI/UX"},
  {"name": "Bayu", "role": "Backend Dev"},
];

final List<Map<String, dynamic>> yourTasks = [
  {
    "title": "Design Homepage",
    "status": "Pending",
    "icon": "schedule",
    "category": "IT General",
    "subtitle": "Internship",
    "avatarUrl": "https://via.placeholder.com/150",
    "dueDate": "03 November 2025",
    "duration": "~1h",
    "progress": 50,
  },
  {
    "title": "Fix Login Bug",
    "status": "Doing",
    "icon": "error",
    "category": "IT General",
    "subtitle": "Internship",
    "avatarUrl": "https://via.placeholder.com/150",
    "dueDate": "31 Oktober 2025",
    "duration": "3d",
    "progress": 80,
  },
  {
    "title": "Submit Report",
    "status": "Complete",
    "icon": "check",
    "category": "IT General",
    "subtitle": "Internship",
    "avatarUrl": "https://via.placeholder.com/150",
    "dueDate": "15 November 2025",
    "duration": "~2h",
    "progress": 100,
  },
];

final user = userList[0];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fungsi untuk mapping icon string ke IconData
  IconData _getIcon(String icon) {
    switch (icon) {
      case "schedule":
        return Icons.schedule;
      case "error":
        return Icons.error_outline;
      case "check":
        return Icons.check_circle_outline;
      default:
        return Icons.task;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 200;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: expandedHeight,
            backgroundColor: AppPallate.blueA,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double t = ((constraints.biggest.height - kToolbarHeight) /
                        (expandedHeight - kToolbarHeight))
                    .clamp(0.0, 1.0);

                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 20, bottom: 18),
                  centerTitle: false,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 50),
                    opacity: t == 1 ? 0 : 1,
                    child: Text(
                      user["name"] ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  background: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                    decoration: const BoxDecoration(
                      color: AppPallate.blueA,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Profil user dan jabatan
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, ${user['name']}!",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user["role"] ?? "",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/images/avatar-male.png"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Let's make this day productive!",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Jeda antar section
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Bagian Let's Get To Work dengan teks dan tombol Check In
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's get to work!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Please check in before starting your work activities today. "
                          "Your attendance time will be recorded automatically.",
                          style: const TextStyle(
                              color: AppPallate.hitam, fontSize: 13),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/clock.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallate.kuning,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Check In',
                        style: TextStyle(color: AppPallate.hitam),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Jeda antar section
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(left: 16, right: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Employee Schedule',
                          style: TextStyle(
                            color: AppPallate.hitam, // sesuaikan dengan AppColors.blackText
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Schedule for the day',
                          style: TextStyle(
                            color: AppPallate.unselect,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EmployedPage()),
                            );
                          },
                          child: const Text(
                            'View Detail',
                            style: TextStyle(
                              color: AppPallate.blueA, // sesuaikan dengan AppColors.primary
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.only(top: 18, bottom: 8),
                    transform: Matrix4.translationValues(30, 0, 0),
                    child: Image.asset(
                      "assets/images/calendar.png",
                      fit: BoxFit.cover,
                      scale: 4,
                    ),
                  ),
                  Image.asset(
                    "assets/images/person.png", 
                    fit: BoxFit.cover,
                    scale: 4,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Task Summary Card untuk menampilkan jumlah task berdasarkan status
          SliverToBoxAdapter(
            child: TaskSummaryCard(
              pending: 3,
              overdue: 4,
              completed: 400,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Section Your Task dengan daftar task
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Task',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: yourTasks.map((task) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>DetailTaskPage()),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4D4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        task["category"] ?? 'IT General',
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
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // Subtitle
                                    Text(
                                      task["subtitle"] ?? 'Internship',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 8),
                                    // Avatar user
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage(
                                        task["avatarUrl"] ??
                                            'https://via.placeholder.com/150',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today,
                                            color: Colors.red, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Due ${task["dueDate"] ?? "-"}',
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.red),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Waktu durasi
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppPallate.hitam,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      task["duration"] ?? '~1h',
                                      style: const TextStyle(
                                          color: AppPallate.colorprimary, fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // Progress indicator lingkaran dengan persentase
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          value: (task["progress"] ?? 0) / 100,
                                          strokeWidth: 4,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            (task["progress"] ?? 0) == 100
                                                ? Colors.green
                                                : Colors.grey.shade400,
                                          ),
                                          backgroundColor:
                                              Colors.green.shade100,
                                        ),
                                      ),
                                      Text(
                                        '${task["progress"] ?? 0}%',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: (task["progress"] ?? 0) == 100
                                              ? Colors.green
                                              : Colors.grey.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // Status task dengan warna berbeda
                                  Text(
                                    task["status"] ?? 'Pending',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: task["status"] == 'Pending'
                                          ? Colors.redAccent
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget TaskSummaryCard menyajikan ringkasan jumlah task berdasarkan statusnya
class TaskSummaryCard extends StatelessWidget {
  final int pending;
  final int overdue;
  final int completed;

  const TaskSummaryCard({
    super.key,
    required this.pending,
    required this.overdue,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  AppPallate.birumuda,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Task',
            style: TextStyle(
              color: AppPallate.blueA,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildTaskItem('Pending', pending)),
              Expanded(child: _buildTaskItem('Overdue', overdue)),
              Expanded(child: _buildTaskItem('Complete', completed)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: AppPallate.blueA,
                fontSize: 12,
                fontWeight: FontWeight.w400)),
        const SizedBox(height: 6),
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/task-icon.svg",
              width: 16,
              height: 16,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF5D8BBB), BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                count > 1 ? '$count Tasks' : count < 1 ? 'No Task' : '$count Task',
                style: const TextStyle(
                    color: Color(0xFF5D8BBB),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}