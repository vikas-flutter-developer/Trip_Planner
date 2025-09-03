import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/extensions/context_extensions.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _destinationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  String _travelMode = "Flight";
  double _budget = 1000;

  final dateFormat = DateFormat.yMMMd();

  Future<void> _pickDate(bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme; // 👈 using extension

    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Your Trip"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // responsive padding
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Destination
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  labelText: "Destination",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value!.isEmpty ? "Enter destination" : null,
              ),
              SizedBox(height: 16.h),

              // Start Date
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(
                  _startDate == null
                      ? "Select Start Date"
                      : "Start: ${dateFormat.format(_startDate!)}",
                  style: theme.textTheme.bodyMedium, // 👈 theme text
                ),
                trailing: ElevatedButton(
                  onPressed: () => _pickDate(true),
                  child: const Text("Pick"),
                ),
              ),

              // End Date
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: Text(
                  _endDate == null
                      ? "Select End Date"
                      : "End: ${dateFormat.format(_endDate!)}",
                  style: theme.textTheme.bodyMedium, // 👈 theme text
                ),
                trailing: ElevatedButton(
                  onPressed: () => _pickDate(false),
                  child: const Text("Pick"),
                ),
              ),

              SizedBox(height: 16.h),

              // Travel Mode
              DropdownButtonFormField<String>(
                value: _travelMode,
                items: ["Flight", "Train", "Car", "Bus"]
                    .map((mode) => DropdownMenuItem(
                  value: mode,
                  child: Text(mode, style: theme.textTheme.bodyMedium),
                ))
                    .toList(),
                onChanged: (val) => setState(() => _travelMode = val!),
                decoration: const InputDecoration(
                  labelText: "Travel Mode",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.h),

              // Budget
              Text(
                "Budget: \$${_budget.toStringAsFixed(0)}",
                style: theme.textTheme.titleMedium,
              ),
              Slider(
                value: _budget,
                min: 500,
                max: 10000,
                divisions: 20,
                label: "\$${_budget.round()}",
                onChanged: (val) {
                  setState(() {
                    _budget = val;
                  });
                },
              ),
              SizedBox(height: 24.h),

              // Submit Button (Theme handles style)
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go('/trips');
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text("Create Plan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
