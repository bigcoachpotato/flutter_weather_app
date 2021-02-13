import 'package:flutter/material.dart';
import 'package:weather/StatesEvents/WeatherEvent.dart';
import 'package:weather/StatesEvents/WeatherState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BLoC/WeatherBloc.dart';
import 'components/MainScreen.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc('Saint Petersburg'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: Search((query) {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(WeatherRequest(city: query));
                          }));
                    },
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 64),
                child: MainScreen(
                    weather: state.weather, hourlyWeather: state.hourlyWeather),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
