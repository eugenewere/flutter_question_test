import 'package:TrueCitizenTest/model/movie.dart';
import 'package:TrueCitizenTest/model/question.dart';
import 'package:flutter/material.dart';





class MovieList extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Rambo",
    "Avatar",
    "300",
    "Prison Break",
    "Viking",
    "Young Sheldon",
    "Titanic",
    "Rambo",
    "Avatar",
    "300",
    "Prison Break",
    "Viking",
    "Young Sheldon",
    "Titanic",
    "Rambo",
    "Avatar",
    "300",
    "Prison Break",
    "Viking",
    "Young Sheldon",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),

      backgroundColor: Colors.blueGrey.shade400,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index){
              // return Card(
              //   borderOnForeground: true,
              //   color: Colors.white,
              //   elevation: 4.0,
              //   child: ListTile(
              //     trailing: Text("..."),
              //     leading: CircleAvatar(
              //       child: Container(
              //         width: 250,
              //         height: 250,
              //         child: null,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: NetworkImage(movieList[index].images[0]),
              //             fit: BoxFit.cover,
              //             repeat: ImageRepeat.noRepeat,
              //
              //           ),
              //           borderRadius: BorderRadius.circular(13.9),
              //         ),
              //       )
              //     ),
              //     title: Text("${movieList[index].title}"),
              //     subtitle: Text('${movieList[index].genre}'),
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(
              //           builder: (context)=>MovieListViewDetails(
              //             movieName: movieList.elementAt(index).title,
              //             movie: movieList[index],
              //           ),
              //       ));
              //     },
              //     // onTap: () => debugPrint(movies.elementAt(index)),
              //   ),
              //
              // );
              return Stack(
                  children:[
                     movieCard(movieList[index], context),
                     Positioned(
                         top:10.0,
                         child: movieImage(movieList[index].images[0])
                     ),
                  ]
              );
            }
        ),
      ),
    );
  }
  Widget movieCard(Movie movie , BuildContext context){
    return InkWell(
      onTap:  (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>MovieListViewDetails(
                  movieName: movie.title,
                  movie: movie,
                ),
            ));
          },
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movie.title),
                      Text("Rating ${movie.imdbRating}/10"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Released: ${movie.released}"),
                      Text(movie.runtime),
                      Text(movie.rated),
                    ],
                  ),

                ],
              ),
            ),
          ),
      ),
    );
  }
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl ?? "https://png.pngtree.com/element_our/20200610/ourmid/pngtree-black-default-avatar-image_2237212.jpg"),
        )
      ),
    );
  }
}


class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie: ${this.movie.title}"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('Go back'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}







class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex =0;
  List questionBank = [
    Question("1 this is your name: Eugene", false),
    Question("2 this is your name: Eugene", true),
    Question("3 this is your name: Eugene", false),
    Question("4 this is your name: Eugene", true),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True citizen"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context ) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/kenya.png", height: 250, width: 180,)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex%questionBank.length].questionText,
                    style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white,
                    ),
                    ),
                  )),
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid
                    )
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(child:Text("True", style: TextStyle(color: Colors.white),),onPressed: ()=>_checkAnswer(true, context),color: Colors.blueGrey.shade900,),
                  RaisedButton(child:Text("False", style: TextStyle(color: Colors.white),), onPressed: ()=>_checkAnswer(false, context),color: Colors.blueGrey.shade900,),
                  RaisedButton(child:Icon(Icons.arrow_forward, color: Colors.white,) , onPressed: ()=>_nextQuestion(),color: Colors.blueGrey.shade900,),

                ],
              ),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
     if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
       final snackBar = SnackBar(
         content: Text('Is Correct', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.green,
         duration: Duration(milliseconds: 500),
       );
       Scaffold.of(context).showSnackBar(snackBar);
       setState(() {
         _currentQuestionIndex++;
       });
     }
     else{
       final snackBar = SnackBar(
         content: Text('Is InCorrect', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.red,
         duration: Duration(milliseconds: 500),
         // duration: Duration.secondsPerMinute.,
       );
       Scaffold.of(context).showSnackBar(snackBar);
       setState(() {
         _currentQuestionIndex++;
       });
     }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }
}


