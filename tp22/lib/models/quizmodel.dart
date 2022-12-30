class Quiz {
  String image = "";
  String question;
  String answer;

  Quiz({required this.image, required this.question, required this.answer});

  String getImage() {return image;}
  void setImage(String newImage) {image = newImage;}

  String getQuestion() { return question;}
  void setQuestion(String getQuestion) {question = getQuestion;}

  String getAnswer() {return answer;}
  void setAnswer(String getAnswer) {answer = getAnswer;}


}
