import 'package:floothink_app/theme/app_pallate.dart';
import 'package:flutter/material.dart';

class EmployedPage extends StatelessWidget {
  const EmployedPage({super.key});

  final List<Map<String, String>> employees = const [
    {"name": "Rahmat", "role": "IT Intern"},
    {"name": "Riza", "role": "UI/UX Designer"},
    {"name": "Dimas", "role": "Mobile Dev"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employed", style: TextStyle(color: AppPallate.blueA, fontWeight: FontWeight.bold),),
        backgroundColor: AppPallate.cream,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final e = employees[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmployeeDetailPage(
                    name: e["name"]!,
                    role: e["role"]!,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.person)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e["name"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(e["role"]!, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmployeeDetailPage extends StatelessWidget {
  final String name;
  final String role;
  const EmployeeDetailPage({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Role: $role", style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
