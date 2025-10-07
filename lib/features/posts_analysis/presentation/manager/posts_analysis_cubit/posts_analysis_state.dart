abstract class PostsAnalysisStates {}

class PostsAnalysisInitialState extends PostsAnalysisStates{}

class GetViralPostsSuccessState extends PostsAnalysisStates{}
class GetViralPostsErrorState extends PostsAnalysisStates{}
class GetViralPostsLoadingState extends PostsAnalysisStates{}

class ChangePlatformState extends PostsAnalysisStates{}
