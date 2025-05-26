import 'package:flutter/material.dart';

class LeadCardWidget extends StatelessWidget {
  const LeadCardWidget({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.iconPath,
  });

  final String title;
  final String count;
  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width:172,
        height:135,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(

          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
                      Text("Leads", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black)),
                      Text(count, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: Colors.black)),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start

                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            iconPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 50,)

                    ],
                  ),

                ]

            ),


          ],
        ),
      ),
    );
  }
}