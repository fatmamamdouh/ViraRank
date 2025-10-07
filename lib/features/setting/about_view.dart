import 'package:flutter/material.dart';
import 'package:ieee/components/components.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        "About App",
          context
      ),
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
                  '''ViraRank is an AI-powered platform built for SEO specialists, digital marketers, and content creators who want to maximize the impact of their online presence.
The app provides two main services:
Website Analysis: enter any website URL and ViraRank will estimate how the site could rank on Google based on structure, content quality, and keyword optimization. You also receive practical recommendations to improve ranking potential.
Post Analysis: paste a social media post or idea, choose the platform, and ViraRank will predict whether it has the potential to go viral. The system checks engagement triggers, sentiment, length, and format to give you a performance score.
Key features include:
AI-driven ranking and virality predictions
Clear scoring system to measure strength and weaknesses
Suggestions for keywords, hashtags, and content improvements
History of past searches for quick access
Simple and intuitive interface
ViraRank helps you save time, avoid guesswork, and focus on strategies that actually work. Whether you are planning an SEO campaign or creating social media content, ViraRank gives you confidence before hitting publish.
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
