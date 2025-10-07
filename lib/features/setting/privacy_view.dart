import 'package:flutter/material.dart';
import 'package:ieee/components/components.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Privacy", context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 207, 224, 241),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  '''1.Data Collection :
We may collect basic information such as email, name, or login details if you create an account.
When you enter a website URL or social media content for analysis, the data is processed temporarily to generate results. We do not store or share this content without your permission.
2.Data Usage :
The information you provide is only used to deliver AI analysis and improve the service.
We may use anonymous usage data (like search frequency or feature usage) to enhance app performance.
3.Data Storage :
Search history is saved locally on your device unless you create an account and choose to sync.
Sensitive data such as account credentials is encrypted.
4.Third-Party Services :
The app may use third-party analytics tools (e.g., Google Analytics, Firebase) to understand performance.
No personal information is sold or rented to advertisers.
5.User Rights :
You can request to delete your account and all related data at any time.
You can clear your local search history from settings.
6.Updates :
Privacy Policy may be updated from time to time. You will be notified of major changes inside the app.
7.Contact :
If you have questions about privacy, contact us at: [support@virarank.com].
''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff5893D4),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
