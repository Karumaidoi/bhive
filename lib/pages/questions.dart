import 'package:bhive/model/app_data.dart';
import 'package:bhive/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../model/home_view_model.dart';
import '../widgets/anime_item.dart';
import '../widgets/loading_screen.dart';

class GitHubPage extends StatefulWidget {
  GitHubPage({Key? key}) : super(key: key);

  @override
  State<GitHubPage> createState() => _GitHubPageState();
}

class _GitHubPageState extends State<GitHubPage> {
  final Options = ['Male', 'Female'];
  late PageController _controller;
  late Future<QuestionModel> questionObject;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    questionObject = GetData().getDataApi();
    print(questionObject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text('Question 1 / 10'),
            const Divider(thickness: 1, color: Colors.grey),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return buildQuestion();
                },
              ),
            ),
            buildElevatedButton(),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        const Text(
          'What\'s is your gender?',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
            child: OptionsWidget(
          question: Options,
          onClickedOption: (options) {},
        )),
      ],
    );
  }

  buildElevatedButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            _controller.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInExpo);
          },
          child: const Text('Next')),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final List<String> question;
  final ValueChanged onClickedOption;
  const OptionsWidget(
      {Key? key, required this.question, required this.onClickedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            question.map((option) => buildOption(context, option)).toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, String option) {
    return GestureDetector(
      onTap: () {
        onClickOption(option);
      },
      child: Container(
        height: 45,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
            color: Colors.grey.shade200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void onClickOption(String option) {}
}

//HOME

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.getData(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text("AnimeList", style: TextStyle(color: Colors.white)),
                actions: <Widget>[
                  // IconButton(
                  //   icon: const Icon(Icons.search),
                  //   onPressed: () async {
                  //     final String selected = await showSearch(
                  //         context: context,
                  //         delegate: Search(anime: model.animeList));
                  //     if (selected != null && selected != query) {
                  //       setState(() {
                  //         query = selected;
                  //       });
                  //     }
                  //   },
                  // )
                ],
              ),
              body: model.animeList.length != 0
                  ? Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: model.animeList.length,
                          itemBuilder: (context, index) {
                            return AnimeItem(
                              anime: model.animeList[index],
                            );
                          }),
                    )
                  : LoadingScreen(
                      text: model.text,
                    ),
            ));
  }
}
