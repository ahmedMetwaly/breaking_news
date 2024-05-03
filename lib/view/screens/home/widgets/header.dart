import 'package:breaking_news/bloc/news/news_bloc.dart';
import 'package:breaking_news/bloc/news/news_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/view/screens/home/widgets/coustom_appbar.dart';
import 'package:breaking_news/view/screens/home/widgets/slider_item.dart';
import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/news/news_event.dart';
import '../../../../model/article_model.dart';
import '../../../../resources/values_manager.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const CoustomAppBar(),
      BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is InitialState) {
          context.read<NewsBloc>().country =
              AuthenticationBloc.user.country ?? "us";

          context.read<NewsBloc>().add(GetTopHeadline());
        }
        if (state is LoadingState) {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: const Center(child: CircularProgressIndicator()));
        }
        if (state is SuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingManager.pInternalPadding),
            child: CarouselSlider.builder(
              itemCount: state.specificTopic?.articles?.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) =>
                      SliderItem(
                article: ArticleModel(
                    imageUrl: state.specificTopic?.articles?[index].imageUrl,
                    title: state.specificTopic?.articles?[index].title,
                    author: state.specificTopic?.articles?[index].author,
                    url: state.specificTopic?.articles?[index].url,
                    description:
                        state.specificTopic?.articles?[index].description,
                    source: state.specificTopic?.articles?[index].source,
                    content: state.specificTopic?.articles?[index].content,
                    time: state.specificTopic?.articles?[index].time),
              ),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.9,
                enlargeCenterPage: true,
                // height: MediaQuery.of(context).size.height*0.35,
              ),
            ),
          );
        }
        if (state is ErrorState) {
          //TODO:: make an error page
          return Text("ERROR");
        }
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: const Center(child: CircularProgressIndicator()));
      })
    ]));
  }
}
