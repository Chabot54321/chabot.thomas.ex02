import 'dart:html';

// J'ai asseillé pendant plusieurs heures de convertir les lettresmajuscules en minuscule (.tolowercase()) mais sans réussir. 
// Il fait donc une différence en A et a, comme des charactères différents.
// si vous pouviez m'indiquer comment y parvenir. Merci!

// J'ai simplement enlever l'espace dans var testWithout = text.replaceALL(regex, " ICI ") et dans la ligne suivante
List fromTextToWords(String text) {
   //var regexp = new RegExp("[,;:.?!()'`’“\"\n]");
  var regexp1 = new RegExp(r"(\W)");
    var textWithout = text.replaceAll(regexp1, '');
       //var textlow = textWithout.toLowerCase();
        return textWithout.split('');
      
}

Map analyzeWordFrequency(List wordList) {S
  var wordFrequencyMap = new Map();
  
  for (var w in wordList) {
        var word = w.trim();
        if (word != '') {
            if (!wordFrequencyMap.containsKey(word)) {
        wordFrequencyMap[word] = 0;
              }
            wordFrequencyMap[word] = wordFrequencyMap[word] + 1;
          }
  }
    return wordFrequencyMap;
  }

List sortWords(Map wordFrequencyMap) {
  var wordWordFrequencyMap = new Map<String, String>();
  wordFrequencyMap.forEach((k, v) =>
  wordWordFrequencyMap[k] = '${k}: ${v.toString()}');
  List sortedWordList = wordWordFrequencyMap.values.toList();
  sortedWordList.sort((m,n) => m.compareTo(n));
  return sortedWordList;
}

void main() {
  TextAreaElement textArea = document.query('#text');
  TextAreaElement wordsArea = document.query('#words');
  ButtonElement wordsButton = document.query('#frequency');
  ButtonElement clearButton = document.query('#clear');
  wordsButton.onClick.listen((MouseEvent e) {
  wordsArea.value = 'Characters: frequency \n';
   
    var text = textArea.value.trim();
    //var textlow = text.toLowerCase()== text;
      if (text != '') {
      var wordsList = fromTextToWords(textArea.value);
      var wordsMap = analyzeWordFrequency(wordsList);
      var sortedWordsList = sortWords(wordsMap);
      
      sortedWordsList.forEach((word) => wordsArea.value = '${wordsArea.value} \n${word}');
    }
  });
  clearButton.onClick.listen((MouseEvent e) {
    textArea.value = '';
    wordsArea.value = '';
  });
}


