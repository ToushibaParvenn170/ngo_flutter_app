import 'package:flutter/material.dart';

void main() => runApp(NGOApp());

class NGOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basti Ki Pathshala',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final pages = [HomePage(), VolunteerForm()];

  void _onSelect(int idx) {
    setState(() => _selectedIndex = idx);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basti Ki Pathshala'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.school, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Basti Ki Pathshala',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Foundation', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => _onSelect(0),
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism),
              title: Text('Volunteer Form'),
              onTap: () => _onSelect(1),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo.shade100,
            ),
            padding: EdgeInsets.all(16),
            child: Icon(Icons.school, size: 80, color: Colors.indigo),
          ),
          SizedBox(height: 16),
          Text(
            'Basti Ki Pathshala Foundation',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Welcome! We are dedicated to empowering underprivileged communities '
            'through education, skill development, and social awareness. '
            'Join us in making a positive difference in the lives of those who need it the most.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('What We Do', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    '• Free educational support\n'
                    '• Community outreach programs\n'
                    '• Digital literacy workshops',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '', phone = '', city = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thank you for volunteering, $name!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Volunteer Form',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
              onSaved: (v) => name = v!.trim(),
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter name' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                hintText: 'Enter phone',
              ),
              keyboardType: TextInputType.phone,
              onSaved: (v) => phone = v!.trim(),
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter phone' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
                hintText: 'Enter city',
              ),
              onSaved: (v) => city = v!.trim(),
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter city' : null,
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

         


