import 'package:flutter/material.dart';

class DesignAppInterface extends StatelessWidget {
  const DesignAppInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text('Wedding Organizer', style: TextStyle(color: Colors.white,fontFamily: "Sevillana",fontSize: 26),),
            Text('Pre wedding, Photo, Party', style: TextStyle(color: Colors.white,fontFamily: "Sevillana"),),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white),child: Text('Our services')),
            Spacer(),
            Text('345 Moo 1 Tasud Chinang Rai, Thailand',style: TextStyle(color: Colors.grey[200])),
          ],
        ),
      ),
    );
  }
}
