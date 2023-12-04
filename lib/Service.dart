import 'package:flutter/material.dart';

import 'Home.dart';

class Service extends StatefulWidget {
  final String serviceName;
  final String imagePath;

  const Service({
    Key? key,
    required this.serviceName,
    required this.imagePath,
  }) : super(key: key);

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName),
        backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0), // Set the appbar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Book ${widget.serviceName}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0), // Set the button color
              ),
              child: Text(
                'Select Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(color: Colors.white), // Set the button text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0), // Set the button color
              ),
              child: Text(
                'Select Time: ${_selectedTime.format(context)}',
                style: const TextStyle(color: Colors.white), // Set the button text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Display button functionality for each service item
                // You can use _selectedDate and _selectedTime here as needed
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Details'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Service: ${widget.serviceName}', style: const TextStyle(fontSize: 18)),
                          Text('Selected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}'),
                          Text('Selected Time: ${_selectedTime.format(context)}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(66, 125, 159, 1.0), // Set the button color
              ),
              child: const Text(
                'Display Details',
                style: TextStyle(color: Colors.white), // Set the button text color
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Booked! '),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Service: ${widget.serviceName} is booked on ${_selectedDate.toLocal().toString().split(' ')[0]} at ${_selectedTime.format(context)}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
               backgroundColor:  const Color.fromRGBO(66, 125, 159, 1.0),
              ),
              child: const Text(
                'Book Service',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
