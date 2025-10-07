import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/components/components.dart';
import 'package:ieee/features/websites_analysis_screen/data/response_seo_model.dart';
import '../manager/website_analysis_cubit/website_analysis_cubit.dart';
import '../manager/website_analysis_cubit/website_analysis_states.dart';

class WebResult extends StatelessWidget {
  WebResult(this.responseOfSEOModel, {super.key});

  ResponseOfSEOModel? responseOfSEOModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebsiteAnalysisCubit, WebsiteAnalysisStates>(
      builder: (context, state)
      {
        if(state is GetSeoResponseSuccessState)
        {
          return Scaffold(
            backgroundColor: Color(0xffEDEFF3),
            appBar: customAppBar("Result", context),
            body: SingleChildScrollView(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'website overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 12,
                                  ),
                                  child: Text(
                                    'Rank',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: responseOfSEOModel!.seo_friendly ? Color(0xff27D095) : Color(0xffE74C3C),
                                        width: 20,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        responseOfSEOModel!.seo_friendly
                                            ? Image.asset('assets/images/up.png', width: 35, height: 35,)
                                            : Image.asset('assets/images/down.png', width: 35, height: 35,),
                                        SizedBox(height: 10),
                                        Text(
                                          responseOfSEOModel!.seo_friendly ? 'match' : 'not match',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Ubuntu',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 12,
                                ),
                                child: Text(
                                  'Chance to appear in search',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 65.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 280,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 12,
                                          thumbShape: SliderComponentShape.noThumb,
                                          overlayShape: SliderComponentShape.noThumb,
                                          activeTrackColor: Color(0xff0000FF),
                                          inactiveTrackColor: Colors.grey.shade300,
                                        ),
                                        child: Slider(
                                          min: 0,
                                          max: 100,
                                          value:  responseOfSEOModel!.probability,
                                          onChanged: (value) {
                                            responseOfSEOModel!.probability = value ;
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        '${responseOfSEOModel!.probability.toInt()}%',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Class',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    (responseOfSEOModel!.top_class == 'Top1' || responseOfSEOModel!.top_class == 'Top2' || responseOfSEOModel!.top_class == 'Top3')
                                        ? Image.asset('assets/images/top_icon.png')
                                        : Container(
                                      width: 30,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Text(
                                      (responseOfSEOModel!.top_class == 'Top1' || responseOfSEOModel!.top_class == 'Top2' || responseOfSEOModel!.top_class == 'Top3')
                                          ? responseOfSEOModel!.top_class : 'Below 10',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                (responseOfSEOModel!.top_class == 'Top1' || responseOfSEOModel!.top_class == 'Top2' || responseOfSEOModel!.top_class == 'Top3')
                                    ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Likely to rank ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' #${responseOfSEOModel!.top_class[3]}  ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff27D095),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'on Google',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    : Text(
                                  'Needs work to reach first page',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        } else
        {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

