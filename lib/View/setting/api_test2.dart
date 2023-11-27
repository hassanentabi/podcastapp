import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/customer_button.dart';

class ApiTest2Page extends StatefulWidget {
  const ApiTest2Page({Key? key}) : super(key: key);

  @override
  State<ApiTest2Page> createState() => _ApiTest2PageState();
}

class _ApiTest2PageState extends State<ApiTest2Page> {
  late TextEditingController _txtId;

  @override
  void initState() {
    super.initState();
    _txtId = TextEditingController();
  }

  Future<void> deleteData(String id) async {
    final token = await getToken();
    final userId = id;
    final deleteUrl = 'https://test.lavetro-agency.com/api/users/$userId';

    final response = await http.delete(
      Uri.parse(deleteUrl),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, you can handle the success here
      print('Successfully deleted user with ID $userId');
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to delete user \n'
          'Your status code is ${response.statusCode}');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _txtId,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                  labelText: 'Enter your account id ',
                  hintText: '1002',
                  //fillColor:Colors.black,
                  prefixIcon: Icon(Icons.delete),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),

              ),
            ),
            SizedBox(height: 16),
            CustomerButtom(
              title: 'delete Account',
              color: Colors.red,
              onPressed: () {
                setState(() {
                  deleteData(_txtId.text);
                });
              },
            ),
            SizedBox(height: 50),

            FutureBuilder(
              future: deleteData(_txtId.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Account delete successful'),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
