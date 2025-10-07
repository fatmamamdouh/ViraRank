abstract class WebsiteAnalysisStates {}

class WebsiteAnalysisInitialState extends WebsiteAnalysisStates{}

class GetContentRepoLoadingState extends WebsiteAnalysisStates{}

class GetContentRepoSuccessState extends WebsiteAnalysisStates{}

class GetContentRepoFailureState extends WebsiteAnalysisStates{}


class GetHtmlCodeLoadingState extends WebsiteAnalysisStates{}

class GetHtmlCodeSuccessState extends WebsiteAnalysisStates{}

class GetHtmlCodeFailureState extends WebsiteAnalysisStates{}


class GetSeoResponseLoadingState extends WebsiteAnalysisStates{}

class GetSeoResponseSuccessState extends WebsiteAnalysisStates{}

class GetSeoResponseFailureState extends WebsiteAnalysisStates{}