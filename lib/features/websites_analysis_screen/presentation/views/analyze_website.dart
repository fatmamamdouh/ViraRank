import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/websites_analysis_screen/presentation/views/website_analysis_widget/custom_elevated_button.dart';
import 'package:ieee/features/websites_analysis_screen/presentation/views/website_analysis_widget/fieldForLink.dart';
import 'package:ieee/components/components.dart';
import '../manager/website_analysis_cubit/website_analysis_cubit.dart';
import '../manager/website_analysis_cubit/website_analysis_states.dart';
import 'web_result.dart';

class website_analysis extends StatelessWidget {
  website_analysis({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebsiteAnalysisCubit, WebsiteAnalysisStates>(
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("analyze website", context),
        body: SingleChildScrollView(
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text('See your website’s potential',style: TextStyle(color: Color(0xff5893D4),fontWeight: FontWeight.bold,fontSize: 32,fontFamily: 'Ubuntu'),),
                ),
              SizedBox(height: 30,),
              Fieldforlink(
                hintText: 'github_username/project_name',
                controller: WebsiteAnalysisCubit.get(context).githubRepoLinkController,
              ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,height: 1,
                        color: Colors.black54,
                      ),
                      Text('OR',style: TextStyle(color: const Color.fromARGB(255, 185, 185, 185),fontWeight: FontWeight.bold),),
                      Container(
                        width: 80,height: 1,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                BlocConsumer<WebsiteAnalysisCubit, WebsiteAnalysisStates>(
                  builder: (context, state) => CustomElevatedButton(
                      textOfButton: "Analyze Website",
                      onPressed: ()
                      {
                        WebsiteAnalysisCubit.get(context).getRepoContents();
                      },
                  ),
                  listener: (context, state) {
                    if (state is GetSeoResponseSuccessState) {
                      final model = WebsiteAnalysisCubit.get(context).responseOfSEOModel;
                      navigateTo(WebResult(model), context);
                    } 
                  },
                ),
                Image.asset('assets/images/spot.png')
            ],
          ),
        ),
      ),
    );
  }
}