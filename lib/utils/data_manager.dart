import 'dart:math';

import '../pages/quiz_selector_page.dart';
import '../utils/question.dart';

class DataGenerator {
  final List<String> _countries = [
    "China", "India", "United States", "Indonesia", "Brazil", "Pakistan", "Nigeria", "Bangladesh", "Russia", "Mexico", "Japan", "Ethiopia", "Philippines", "Egypt", "Vietnam", "Congo, Democratic Republic of the", "Germany", "Iran", "Turkey", "Thailand", "United Kingdom", "France", "Italy", "Tanzania", "South Africa", "Myanmar", "South Korea", "Kenya", "Colombia", "Spain", "Argentina", "Uganda", "Ukraine", "Algeria", "Sudan", "Iraq", "Poland", "Canada", "Afghanistan", "Morocco", "Saudi Arabia", "Peru", "Venezuela", "Uzbekistan", "Malaysia", "Angola", "Mozambique", "Nepal", "Ghana", "Yemen", "Madagascar", "North Korea", "Cote d'Ivoire", "Australia", "Cameroon", "Taiwan", "Niger", "Sri Lanka", "Burkina Faso", "Romania", "Malawi", "Mali", "Kazakhstan", "Syria", "Chile", "Zambia", "Guatemala", "Netherlands", "Zimbabwe", "Ecuador", "Senegal", "Cambodia", "Chad", "Somalia", "Guinea", "South Sudan", "Rwanda", "Tunisia", "Belgium", "Cuba", "Benin", "Burundi", "Bolivia", "Greece", "Haiti", "Dominican Republic", "Czech Republic", "Portugal", "Sweden", "Azerbaijan", "Jordan", "Hungary", "United Arab Emirates", "Belarus", "Honduras", "Tajikistan", "Serbia", "Austria", "Switzerland", "Israel", "Papua New Guinea", "Togo", "Sierra Leone", "Bulgaria", "Laos", "Paraguay", "Libya", "El Salvador", "Nicaragua", "Kyrgyzstan", "Lebanon", "Turkmenistan", "Singapore", "Denmark", "Finland", "Slovakia", "Congo", "Norway", "Eritrea", "Costa Rica", "Liberia", "Oman", "Ireland", "New Zealand", "Central African Republic", "Mauritania", "Kuwait", "Croatia", "Panama", "Moldova", "Georgia", "Bosnia and Herzegovina", "Uruguay", "Mongolia", "Albania", "Armenia", "Jamaica", "Lithuania", "Qatar", "Namibia", "Botswana", "Lesotho", "Gambia", "Macedonia", "Slovenia", "Gabon", "Latvia", "Guinea-Bissau", "Bahrain", "Swaziland", "Trinidad and Tobago", "East Timor", "Equatorial Guinea", "Estonia", "Mauritius", "Cyprus", "Djibouti", "Fiji", "Comoros", "Bhutan", "Guyana", "Montenegro", "Solomon Islands", "Luxembourg", "Suriname", "Maldives", "Brunei", "Malta", "Bahamas", "Belize", "Iceland", "French Guiana", "Barbados", "Vanuatu", "Sao Tome and Principe", "Samoa", "Saint Lucia", "Kiribati", "Tonga", "Grenada", "Antigua and Barbuda", "Seychelles", "Andorra", "Dominica", "Marshall Islands", "Monaco", "Liechtenstein", "San Marino", "Palau", "Nauru", "Tuvalu", "Vatican City"
  ];

  final List<String> _capitals = [
    "Beijing", "New Delhi", "Washington D.C.", "Jakarta", "Brasilia", "Islamabad", "Abuja", "Dhaka", "Moscow", "Mexico City", "Tokyo", "Addis Ababa", "Manila", "Cairo", "Hanoi", "Kinshasa", "Berlin", "Tehran", "Ankara", "Bangkok", "London", "Paris", "Rome", "Dodoma", "Pretoria", "Nay Pyi Taw", "Seoul", "Nairobi", "Bogota", "Madrid", "Buenos Aires", "Kampala", "Kiev", "Algiers", "Khartoum", "Baghdad", "Warsaw", "Ottawa", "Kabul", "Rabat", "Riyadh", "Lima", "Caracas", "Tashkent", "Kuala Lumpur", "Luanda", "Maputo", "Kathmandu", "Accra", "Sanaa", "Antananarivo", "Pyongyang", "Yamoussoukro", "Canberra", "Yaounde", "Taipei", "Niamey", "Colombo", "Ouagadougou", "Bucharest", "Lilongwe", "Bamako", "Astana", "Damascus", "Santiago", "Lusaka", "Guatemala City", "Amsterdam", "Harare", "Quito", "Dakar", "Phnom Penh", "N'Djamena", "Mogadishu", "Conakry", "Juba", "Kigali", "Tunis", "Brussels", "Havana", "Porto Novo", "Bujumbura", "La Paz", "Athens", "Port au Prince", "Santo Domingo", "Prague", "Lisbon", "Stockholm", "Baku", "Amman", "Budapest", "Abu Dhabi", "Minsk", "Tegucigalpa", "Dushanbe", "Belgrade", "Vienna", "Bern", "Tel Aviv", "Port Moresby", "Lome", "Freetown", "Sofia", "Vientiane", "Asuncion", "Tripoli", "San Salvador", "Managua", "Bishkek", "Beirut", "Ashgabat", "Singapore", "Copenhagen", "Helsinki", "Bratislava", "Brazzaville", "Oslo", "Asmara", "San Jose", "Monrovia", "Muscat", "Dublin", "Wellington", "Bangui", "Nouakchott", "Kuwait City", "Zagreb", "Panama City", "Chisinau", "Tbilisi", "Sarajevo", "Montevideo", "Ulaanbaatar", "Tirana (Tirane)", "Yerevan", "Kingston", "Vilnius", "Doha", "Windhoek", "Gaborone", "Maseru", "Banjul", "Skopje", "Ljubljana", "Libreville", "Riga", "Bissau", "Manama", "Mbabana", "Port of Spain", "Dili", "Malabo", "Tallinn", "Port Louis", "Nicosia", "Djibouti", "Suva", "Moroni", "Thimphu", "Georgetown", "Podgorica", "Honiara", "Luxembourg", "Paramaribo", "Male", "Bandar Seri Begawan", "Valletta", "Nassau", "Belmopan", "Reykjavik", "Cayenne", "Bridgetown", "Port Vila", "Sao Tome", "Apia", "Castries", "Tarawa Atoll", "Nuku'alofa", "Saint George's", "Saint John's", "Victoria", "Andorra la Vella", "Roseau", "Majuro", "Monaco", "Vaduz", "San Marino", "Melekeok", "No official capital", "Funafuti", "Vatican City"
  ];

  final List<String> _population = [
    "1,415,045,928", "1,354,051,854", "326,766,748", "266,794,980", "210,867,954", "200,813,818", "195,875,237", "166,368,149", "143,964,709", "130,759,074", "127,185,332", "107,534,882", "106,512,074", "99,375,741", "96,491,146", "84,004,989", "82,293,457", "82,011,735", "81,916,871", "69,183,173", "66,573,504", "65,233,271", "59,290,969", "59,091,392", "57,398,421", "53,855,735", "51,164,435", "50,950,879", "49,464,683", "46,397,452", "44,688,864", "44,270,563", "44,009,214", "42,008,054", "41,511,526", "39,339,753", "38,104,832", "36,953,765", "36,373,176", "36,191,805", "33,554,343", "32,551,815", "32,381,221", "32,364,996", "32,042,458", "30,774,205", "30,528,673", "29,624,035", "29,463,643", "28,915,284", "26,262,810", "25,610,672", "24,905,843", "24,772,247", "24,678,234", "23,694,089", "22,311,375", "20,950,041", "19,751,651", "19,580,634", "19,164,728", "19,107,706", "18,403,860", "18,284,407", "18,197,209", "17,609,178", "17,245,346", "17,084,459", "16,913,261", "16,863,425", "16,294,270", "16,245,729", "15,353,184", "15,181,925", "13,052,608", "12,919,053", "12,501,156", "11,659,174", "11,498,519", "11,489,082", "11,485,674", "11,216,450", "11,215,674", "11,142,161", "11,112,945", "10,882,996", "10,625,250", "10,291,196", "9,982,709", "9,923,914", "9,903,802", "9,688,847", "9,541,615", "9,452,113", "9,417,167", "9,107,211", "8,762,027", "8,751,820", "8,544,034", "8,452,841", "8,418,346", "7,990,926", "7,719,729", "7,036,848", "6,961,210", "6,896,908", "6,470,956", "6,411,558", "6,284,757", "6,132,932", "6,093,509", "5,851,466", "5,791,901", "5,754,356", "5,542,517", "5,449,816", "5,399,895", "5,353,363", "5,187,948", "4,953,199", "4,853,516", "4,829,946", "4,803,748", "4,749,598", "4,737,423", "4,540,068", "4,197,128", "4,164,783", "4,162,618", "4,041,065", "3,907,131", "3,503,554", "3,469,551", "3,121,772", "2,934,363", "2,934,152", "2,898,677", "2,876,475", "2,694,849", "2,587,801", "2,333,201", "2,263,010", "2,163,765", "2,085,051", "2,081,260", "2,067,561", "1,929,938", "1,907,268", "1,566,993", "1,391,385", "1,372,598", "1,324,094", "1,313,894", "1,306,788", "1,268,315", "1,189,085", "971,408", "912,241", "832,347", "817,054", "782,225", "629,219", "623,281", "590,321", "568,301", "444,259", "434,076", "432,089", "399,285", "382,444", "337,78", "289,763", "286,388", "282,117", "208,818", "197,695", "179,667", "118,414", "109,008", "108,339", "103,05", "95,235", "76,953", "74,308", "53,167", "38,897", "38,155", "33,557", "21,964", "11,312", "11,287", "801"
  ];
  final List<List<String>> _frontiers = [
    ["Afghanistan", "Bhutan", "Myanmar", "Hong Kong", "India", "Kazakhstan", "Nepal", "North Korea", "Kyrgyzstan", "Laos", "Macau", "Mongolia", "Pakistan" ], ["Bangladesh", "Bhutan", "Myanmar", "China", "Nepal", "Pakistan"], ["Canada", "Mexico"], ["Timor-Leste", "Malaysia", "Papua New Guinea"], [ "Argentina", "Bolivia", "Colombia", "French Guiana", "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela" ], ["Afghanistan", "China", "India", "Iran"], ["Benin", "Cameroon", "Chad", "Niger"], ["Myanmar", "India"], [ "Azerbaijan", "Belarus", "China", "Estonia", "Finland", "Georgia", "Kazakhstan", "North Korea", "Latvia", "Lithuania", "Mongolia", "Norway", "Poland" ], ["Belize", "Guatemala", "United States"], [], ["Djibouti", "Eritrea", "Kenya", "Somalia", "South Sudan", "Sudan"], [], ["Israel", "Libya", "Palestine", "Sudan"], ["Cambodia", "China", "Laos"], [], [ "Austria", "Belgium", "Czechia", "Denmark", "France", "Luxembourg", "Netherlands", "Poland", "Switzerland" ], [ "Afghanistan", "Armenia", "Azerbaijan", "Iraq", "Pakistan", "Turkey", "Turkmenistan" ], [ "Armenia", "Azerbaijan", "Bulgaria", "Georgia", "Greece", "Iran", "Iraq", "Syria" ], ["Myanmar", "Cambodia", "Laos", "Malaysia"], ["Ireland"], [ "Andorra", "Belgium", "Germany", "Italy", "Luxembourg", "Monaco", "Spain", "Switzerland" ], [ "Austria", "France", "San Marino", "Slovenia", "Switzerland", "Vatican City" ], [ "Burundi", "DR Congo", "Kenya", "Malawi", "Mozambique", "Rwanda", "Uganda", "Zambia" ], ["Botswana", "Lesotho", "Mozambique", "Namibia", "Eswatini", "Zimbabwe"], ["Bangladesh", "China", "India", "Laos", "Thailand"], ["North Korea"], ["Ethiopia", "Somalia", "South Sudan", "Tanzania", "Uganda"], ["Brazil", "Ecuador", "Panama", "Peru", "Venezuela"], ["Andorra", "France", "Gibraltar", "Portugal", "Morocco"], ["Bolivia", "Brazil", "Chile", "Paraguay", "Uruguay"], ["DR Congo", "Kenya", "Rwanda", "South Sudan", "Tanzania"], [ "Belarus", "Hungary", "Moldova", "Poland", "Romania", "Russia", "Slovakia" ], [ "Tunisia", "Libya", "Niger", "Western Sahara", "Mauritania", "Mali", "Morocco" ], [ "Central African Republic", "Chad", "Egypt", "Eritrea", "Ethiopia", "Libya", "South Sudan" ], ["Iran", "Jordan", "Kuwait", "Saudi Arabia", "Syria", "Turkey"], [ "Belarus", "Czechia", "Germany", "Lithuania", "Russia", "Slovakia", "Ukraine" ], ["United States"], ["Iran", "Pakistan", "Turkmenistan", "Uzbekistan", "Tajikistan", "China"], ["Algeria", "Western Sahara", "Spain"], [ "Iraq", "Jordan", "Kuwait", "Oman", "Qatar", "United Arab Emirates", "Yemen" ], ["Bolivia", "Brazil", "Chile", "Colombia", "Ecuador"], ["Brazil", "Colombia", "Guyana"], ["Afghanistan", "Kazakhstan", "Kyrgyzstan", "Tajikistan", "Turkmenistan"], ["Brunei", "Indonesia", "Thailand"], ["Republic of the Congo", "DR Congo", "Zambia", "Namibia"], ["Malawi", "South Africa", "Eswatini", "Tanzania", "Zambia", "Zimbabwe"], ["China", "India"], ["Burkina Faso", "Ivory Coast", "Togo"], ["Oman", "Saudi Arabia"], [], ["China", "South Korea", "Russia"], [], [], [ "Central African Republic", "Chad", "Republic of the Congo", "Equatorial Guinea", "Gabon", "Nigeria" ], [], ["Algeria", "Benin", "Burkina Faso", "Chad", "Libya", "Mali", "Nigeria"], ["India"], ["Benin", "Ivory Coast", "Ghana", "Mali", "Niger", "Togo"], ["Bulgaria", "Hungary", "Moldova", "Serbia", "Ukraine"], ["Mozambique", "Tanzania", "Zambia"], [ "Algeria", "Burkina Faso", "Guinea", "Ivory Coast", "Mauritania", "Niger", "Senegal" ], ["China", "Kyrgyzstan", "Russia", "Turkmenistan", "Uzbekistan"], ["Iraq", "Israel", "Jordan", "Lebanon", "Turkey"], ["Argentina", "Bolivia", "Peru"], [ "Angola", "Botswana", "DR Congo", "Malawi", "Mozambique", "Namibia", "Tanzania", "Zimbabwe" ], ["Belize", "El Salvador", "Honduras", "Mexico"], ["Belgium", "Germany"], ["Botswana", "Mozambique", "South Africa", "Zambia"], ["Colombia", "Peru"], ["Gambia", "Guinea", "Guinea-Bissau", "Mali", "Mauritania"], ["Laos", "Thailand", "Vietnam"], [ "Cameroon", "Central African Republic", "Libya", "Niger", "Nigeria", "Sudan" ], ["Djibouti", "Ethiopia", "Kenya"], [ "Ivory Coast", "Guinea-Bissau", "Liberia", "Mali", "Senegal", "Sierra Leone" ], [ "Central African Republic", "DR Congo", "Ethiopia", "Kenya", "Sudan", "Uganda" ], ["Burundi", "DR Congo", "Tanzania", "Uganda"], ["Algeria", "Libya"], ["France", "Germany", "Luxembourg", "Netherlands"], [], ["Burkina Faso", "Niger", "Nigeria", "Togo"], ["DR Congo", "Rwanda", "Tanzania"], ["Argentina", "Brazil", "Chile", "Paraguay", "Peru"], ["Albania", "Bulgaria", "Turkey", "Macedonia"], ["Dominican Republic"], ["Haiti"], [], ["Spain"], ["Finland", "Norway"], ["Armenia", "Georgia", "Iran", "Russia", "Turkey"], ["Iraq", "Israel", "Palestine", "Saudi Arabia", "Syria"], [ "Austria", "Croatia", "Romania", "Serbia", "Slovakia", "Slovenia", "Ukraine" ], ["Oman", "Saudi Arabia"], ["Latvia", "Lithuania", "Poland", "Russia", "Ukraine"], ["Guatemala", "El Salvador", "Nicaragua"], ["Afghanistan", "China", "Kyrgyzstan", "Uzbekistan"], [ "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Hungary", "Kosovo", "Macedonia", "Montenegro", "Romania" ], [ "Czechia", "Germany", "Hungary", "Italy", "Liechtenstein", "Slovakia", "Slovenia", "Switzerland" ], ["Austria", "France", "Italy", "Liechtenstein", "Germany"], ["Egypt", "Jordan", "Lebanon", "Palestine", "Syria"], ["Indonesia"], ["Benin", "Burkina Faso", "Ghana"], ["Guinea", "Liberia"], ["Greece", "Macedonia", "Romania", "Serbia", "Turkey"], ["Myanmar", "Cambodia", "China", "Thailand", "Vietnam"], ["Argentina", "Bolivia", "Brazil"], ["Algeria", "Chad", "Egypt", "Niger", "Sudan", "Tunisia"], ["Guatemala", "Honduras"], ["Costa Rica", "Honduras"], ["China", "Kazakhstan", "Tajikistan", "Uzbekistan"], ["Israel", "Syria"], ["Afghanistan", "Iran", "Kazakhstan", "Uzbekistan"], [], ["Germany"], ["Norway", "Sweden", "Russia"], ["Austria", "Czechia", "Hungary", "Poland"], [], ["Finland", "Sweden", "Russia"], ["Djibouti", "Ethiopia", "Sudan"], ["Nicaragua", "Panama"], ["Guinea", "Ivory Coast", "Sierra Leone"], ["Saudi Arabia", "United Arab Emirates", "Yemen"], ["United Kingdom"], [], [ "Cameroon", "Chad", "DR Congo", "Republic of the Congo", "South Sudan", "Sudan" ], ["Algeria", "Mali", "Senegal", "Western Sahara"], ["Iraq", "Saudi Arabia"], ["Bosnia and Herzegovina", "Hungary", "Montenegro", "Serbia", "Slovenia"], ["Colombia", "Costa Rica"], ["Romania", "Ukraine"], ["Armenia", "Azerbaijan", "Russia", "Turkey"], ["Croatia", "Montenegro", "Serbia"], ["Argentina", "Brazil"], ["China", "Russia"], ["Montenegro", "Greece", "Macedonia", "Kosovo"], ["Azerbaijan", "Georgia", "Iran", "Turkey"], [], ["Belarus", "Latvia", "Poland", "Russia"], ["Saudi Arabia"], ["Angola", "Botswana", "South Africa", "Zambia"], ["Namibia", "South Africa", "Zambia", "Zimbabwe"], ["South Africa"], ["Senegal"], ["Albania", "Bulgaria", "Greece", "Kosovo", "Serbia"], ["Austria", "Croatia", "Italy", "Hungary"], ["Cameroon", "Republic of the Congo", "Equatorial Guinea"], ["Belarus", "Estonia", "Lithuania", "Russia"], ["Guinea", "Senegal"], [], [], [], [], ["Cameroon", "Gabon"], ["Latvia", "Russia"], [], [], ["Eritrea", "Ethiopia", "Somalia"], [], [], ["China", "India"], ["Brazil", "Suriname", "Venezuela"], ["Albania", "Bosnia and Herzegovina", "Croatia", "Kosovo", "Serbia"], [], ["Belgium", "France", "Germany"], ["Brazil", "French Guiana", "Guyana"], [], ["Malaysia"], [], [], ["Guatemala", "Mexico"], [], ["Brazil", "Suriname"], [], [], [], [], [], [], [], [], [], [], ["France", "Spain"], [], [], ["France"], ["Austria", "Switzerland"], ["Italy"], [], [], [], ["Italy"]
  ];

  final List<String> _flags = [
  "🇨🇳", "🇮🇳", "🇺🇸", "🇮🇩", "🇧🇷", "🇵🇰", "🇳🇬", "🇧🇩", "🇷🇺", "🇲🇽", "🇯🇵", "🇪🇹", "🇵🇭", "🇪🇬", "🇻🇳", "", "🇩🇪", "🇮🇷", "🇹🇷", "🇹🇭", "🇬🇧", "🇫🇷", "🇮🇹", "🇹🇿", "🇿🇦", "🇲🇲", "🇰🇷", "🇰🇪", "🇨🇴", "🇪🇸", "🇦🇷", "🇺🇬", "🇺🇦", "🇩🇿", "🇸🇩", "🇮🇶", "🇵🇱", "🇨🇦", "🇦🇫", "🇲🇦", "🇸🇦", "🇵🇪", "🇻🇪", "🇺🇿", "🇲🇾", "🇦🇴", "🇲🇿", "🇳🇵", "🇬🇭", "🇾🇪", "🇲🇬", "🇰🇵", "", "🇦🇺", "🇨🇲", "🇹🇼", "🇳🇪", "🇱🇰", "🇧🇫", "🇷🇴", "🇲🇼", "🇲🇱", "🇰🇿", "🇸🇾", "🇨🇱", "🇿🇲", "🇬🇹", "🇳🇱", "🇿🇼", "🇪🇨", "🇸🇳", "🇰🇭", "🇹🇩", "🇸🇴", "🇬🇳", "🇸🇸", "🇷🇼", "🇹🇳", "🇧🇪", "🇨🇺", "🇧🇯", "🇧🇮", "🇧🇴", "🇬🇷", "🇭🇹", "🇩🇴", "", "🇵🇹", "🇸🇪", "🇦🇿", "🇯🇴", "🇭🇺", "🇦🇪", "🇧🇾", "🇭🇳", "🇹🇯", "🇷🇸", "🇦🇹", "🇨🇭", "🇮🇱", "🇵🇬", "🇹🇬", "🇸🇱", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""
  ];

  List<Question> buildCapitals(List<String> countries, List<String> capitals) {
    List<Question> questionsCapitals = [];

    // llista ordenada de 0 a 199
    var randomIndexList =
        new List<int>.generate(countries.length - 1, (i) => i + 1);
    // Desordenem la llista
    var rng = new Random();
    randomIndexList.shuffle(rng);

    // Per cada pais
    for (var i = 1; i < countries.length; i++) {
      List<String> wrongAswers = [];

      // Escollim les 3 respostes incorrectes
      for (var j = 1; j <= 3; j++) {
        // index random de 1 a num_paisos
        int randomCountry = new Random().nextInt(countries.length - 2) + 1;
        // Si l'index random es el pais, no conta (no podem agafar la rsposta com incorrecta perque serà correcta)
        if (randomCountry == randomIndexList[i - 1]) {
          j--;
        } else {
          if ((capitals[randomCountry - 1] != capitals[randomIndexList[i - 1]])
              && (!wrongAswers.contains(capitals[randomCountry - 1])))
            wrongAswers.add(capitals[randomCountry - 1]);
          else
            j--;
        }
      }
      questionsCapitals.add(new Question(countries[randomIndexList[i - 1]],
          capitals[randomIndexList[i - 1]], wrongAswers));
    }

    return questionsCapitals;
  }

  List<Question> buildPopulation(List<String> countries, List<String> population) {
    List<Question> questionsPopulation = [];

    // llista ordenada de 0 a 199
    var randomIndexList =
        new List<int>.generate(countries.length - 1, (i) => i + 1);
    // Desordenem la llista
    var rng = new Random();
    randomIndexList.shuffle(rng);

    // Per cada pais
    for (var i = 1; i < countries.length; i++) {
      List<String> wrongAswers = [];

      // Escollim les 3 respostes incorrectes
      for (var j = 1; j <= 3; j++) {
        // index random de 1 a num_paisos
        int randomCountry = new Random().nextInt(countries.length - 2) + 1;
        // Si l'index random es el pais, no conta (no podem agafar la rsposta com incorrecta perque serà correcta)
        if (randomCountry == randomIndexList[i - 1]) {
          j--;
        } else {
          if ((population[randomCountry - 1] != population[randomIndexList[i - 1]])
              && (!wrongAswers.contains(population[randomCountry - 1])))
            wrongAswers.add(population[randomCountry - 1]);
          else
            j--;
        }
      }
      questionsPopulation.add(new Question(countries[randomIndexList[i - 1]],
          population[randomIndexList[i - 1]], wrongAswers));
    }

    return questionsPopulation;
  }

  List<Question> buildFrontiers(List<String> countries, List<List<String>> frontiers) {
    List<Question> questionsFrontiers = [];
    // llista ordenada de 0 a 199
    var indexCountryList =
        new List<int>.generate(countries.length - 1, (i) => i + 1);
    // Desordenem la llista
    var rng = new Random();
    indexCountryList.shuffle(rng);

    // Per cada pais
    for (var i = 1; i < countries.length; i++) {
      int indexCountry = indexCountryList[i - 1];

      // Si no te frontera omitim pais
      if (frontiers[indexCountry] != null &&
          frontiers[indexCountry].length != 0) {
        List<String> wrongAswers = [];

        // Escollim les 3 respostes incorrectes
        for (var j = 1; j <= 3; j++) {
          // index random de 1 a num_paisos
          int randomCountry = new Random().nextInt(countries.length - 2) + 1;
          // Si l'index random es el pais, no conta (no podem agafar la rsposta com incorrecta perque serà correcta)
          if (randomCountry == indexCountryList[i - 1] ||
              frontiers[randomCountry - 1].length < 1) {
            j--;
          } else {
            // frontera random

            // Si la frontera no es frontera del pasi és una resposta incorrecte

            int randomFrontier =
                new Random().nextInt(frontiers[randomCountry - 1].length);

            if (frontiers[randomCountry - 1][randomFrontier] !=
                    frontiers[indexCountry][0] &&
                !frontiers[randomCountry - 1].contains(frontiers[indexCountry][0])) {
              wrongAswers.add(frontiers[randomCountry - 1][randomFrontier]);
            } else
              j--;
          }
        }

        questionsFrontiers.add(new Question(
            countries[indexCountry], frontiers[indexCountry][0], wrongAswers));
      }
    }
    return questionsFrontiers;
  }

  List<Question> buildFlags(List<String> countries, List<String> flags) {
    List<Question> questionsFlags = [];

    // llista ordenada de 0 a 199
    var randomIndexList =
    new List<int>.generate(countries.length - 1, (i) => i + 1);
    // Desordenem la llista
    var rng = new Random();
    randomIndexList.shuffle(rng);

    // Per cada pais
    for (var i = 1; i < countries.length; i++) {
      // Si no te frontera omitim pais
      if (flags[randomIndexList[i - 1]] != null &&
          flags[randomIndexList[i - 1]] != "") {
        List<String> wrongAswers = [];

        // Escollim les 3 respostes incorrectes
        for (var j = 1; j <= 3; j++) {
          // index random de 1 a num_paisos
          int randomCountry = new Random().nextInt(countries.length - 2) + 1;
          // Si l'index random es el pais, no conta (no podem agafar la rsposta com incorrecta perque serà correcta)
          if (randomCountry == randomIndexList[i - 1]) {
            j--;
          } else {
            if ((flags[randomCountry - 1] != flags[randomIndexList[i - 1]])
                && (!wrongAswers.contains(flags[randomCountry - 1]))
                && (flags[randomCountry - 1] != ""))
              wrongAswers.add(flags[randomCountry - 1]);
            else
              j--;
          }
        }
        questionsFlags.add(new Question(countries[randomIndexList[i - 1]],
            flags[randomIndexList[i - 1]], wrongAswers));
      }
    }

    return questionsFlags;
  }

  List<Question> getQuestions(int quiz) {
    List<Question> questions = [];
    if (quiz == QuizzesProperties.CAPITALS_QUIZ) {
      questions = buildCapitals(_countries, _capitals);
      questions.shuffle();
      return questions;
    } else if (quiz == QuizzesProperties.FRONTIERS_QUIZ) {
      questions = buildFrontiers(_countries, _frontiers);
      questions.shuffle();
      return questions;
    } else if (quiz == QuizzesProperties.POPULATION_QUIZ) {
      questions = buildPopulation(_countries, _population);
      questions.shuffle();
      return questions;
    }
    else {
      questions = buildFlags(_countries, _flags);

      questions.shuffle();
      return questions;
    }
  }


}

/*final List<String> _countries = [
    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "The Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "The Republic of the Congo", "The Democratic Republic of the Congo", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor (Timor-Leste)", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "The Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "North Korea", "South Korea", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Federated States of Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "The Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "The Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City (Holy See)", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"];
  final List<String> _capitals = [
  "Kabul", "Tirana", "Algiers", "Andorra la Vella", "Luanda", "Saint John's", "Buenos Aires", "Yerevan", "Canberra", "Vienna", "Baku", "Nassau", "Manama", "Dhaka", "Bridgetown", "Minsk", "Brussels", "Belmopan", "Porto-Novo", "Thimphu", "Administrative: La Paz; Judicial: Sucre", "Sarajevo", "Gaborone", "Brasilia", "Bandar Seri Begawan", "Sofia", "Ouagadougou", "Bujumbura", "Phnom Penh", "Yaounde", "Ottawa", "Praia", "Bangui", "N'Djamena", "Santiago", "Beijing", "Bogota", "Moroni", "Brazzaville", "Kinshasa", "San Jose", "Official: Yamoussoukro; De Facto: Abidjan", "Zagreb", "Havana", "Nicosia", "Prague", "Copenhagen", "Djibouti", "Roseau", "Santo Domingo", "Dili", "Quito", "Cairo", "San Salvador", "Malabo", "Asmara", "Tallinn", "Addis Ababa", "Suva", "Helsinki", "Paris", "Libreville", "Banjul", "Tbilisi", "Berlin", "Accra", "Athens", "Saint George's", "Guatemala City", "Conakry", "Bissau", "Georgetown", "Port-au-Prince", "Tegucigalpa", "Budapest", "Reykjavik", "New Delhi", "Jakarta", "Tehran", "Baghdad", "Dublin", "Jerusalem", "Rome", "Kingston", "Tokyo", "Amman", "Astana", "Nairobi", "Tarawa Atoll", "Pyongyang", "Seoul", "Pristina", "Kuwait City", "Bishkek", "Vientiane", "Riga", "Beirut", "Maseru", "Monrovia", "Tripoli", "Vaduz", "Vilnius", "Luxembourg", "Skopje", "Antananarivo", "Lilongwe", "Kuala Lumpur", "Male", "Bamako", "Valletta", "Majuro", "Nouakchott", "Port Louis", "Mexico City", "Palikir", "Chisinau", "Monaco (City State)", "Ulaanbaatar", "Podgorica", "Rabat", "Maputo", "Naypyidaw", "Windhoek", "No official capital - de facto capital is Yaren", "Kathmandu", "Amsterdam", "Wellington", "Managua", "Niamey", "Abuja", "Oslo", "Muscat", "Islamabad", "Melekeok", "Panama City", "Port Moresby", "Asuncion", "Lima", "Manila", "Warsaw", "Lisbon", "Doha", "Bucharest", "Moscow", "Kigali", "Basseterre", "Castries", "Kingstown", "Apia", "San Marino (City State)", "Sao Tome", "Riyadh", "Dakar", "Belgrade", "Victoria", "Freetown", "Singapore (City State)", "Bratislava", "Ljubljana", "Honiara", "Mogadishu", "Administrative: Pretoria; Legislative: Cape Town; Judiciary: Bloemfontein", "Juba", "Madrid", "Sri Jayewardenepura Kotte", "Khartoum", "Paramaribo", "Mbabane", "Stockholm", "Bern", "Damascus", "Taipei", "Dushanbe", "Dodoma", "Bangkok", "Lome", "Nuku'alofa", "Port-of-Spain", "Tunis", "Ankara", "Ashgabat", "Funafuti", "Kampala", "Kyiv", "Abu Dhabi", "London", "Washington D.C.", "Montevideo", "Tashkent", "Port-Vila", "Vatican City", "Caracas", "Hanoi", "Sanaa", "Lusaka", "Harare"];
  */
/*
  final List<String> _countries = [ "China", "India", "United States", "Indonesia", "Brazil", "Pakistan", "Nigeria", "Bangladesh", "Russia", "Mexico", "Japan", "Ethiopia", "Philippines", "Egypt", "Vietnam", "Congo, Democratic Republic of the", "Germany", "Iran", "Turkey", "Thailand", "United Kingdom", "France", "Italy", "Tanzania", "South Africa", "Myanmar", "South Korea", "Kenya", "Colombia", "Spain", "Argentina", "Uganda", "Ukraine", "Algeria", "Sudan", "Iraq", "Poland", "Canada", "Afghanistan", "Morocco", "Saudi Arabia", "Peru", "Venezuela", "Uzbekistan", "Malaysia", "Angola", "Mozambique", "Nepal", "Ghana", "Yemen", "Madagascar", "North Korea", "Cote d'Ivoire", "Australia", "Cameroon", "Taiwan", "Niger", "Sri Lanka", "Burkina Faso", "Romania", "Malawi", "Mali", "Kazakhstan", "Syria", "Chile", "Zambia", "Guatemala", "Netherlands", "Zimbabwe", "Ecuador", "Senegal", "Cambodia", "Chad", "Somalia", "Guinea", "South Sudan", "Rwanda", "Tunisia", "Belgium", "Cuba", "Benin", "Burundi", "Bolivia", "Greece", "Haiti", "Dominican Republic", "Czech Republic", "Portugal", "Sweden", "Azerbaijan", "Jordan", "Hungary", "United Arab Emirates", "Belarus", "Honduras", "Tajikistan", "Serbia", "Austria", "Switzerland", "Israel", "Papua New Guinea", "Togo", "Sierra Leone", "Bulgaria", "Laos", "Paraguay", "Libya", "El Salvador", "Nicaragua", "Kyrgyzstan", "Lebanon", "Turkmenistan", "Singapore", "Denmark", "Finland", "Slovakia", "Congo", "Norway", "Eritrea", "Costa Rica", "Liberia", "Oman", "Ireland", "New Zealand", "Central African Republic", "Mauritania", "Kuwait", "Croatia", "Panama", "Moldova", "Georgia", "Bosnia and Herzegovina", "Uruguay", "Mongolia", "Albania", "Armenia", "Jamaica", "Lithuania", "Qatar", "Namibia", "Botswana", "Lesotho", "Gambia", "Macedonia", "Slovenia", "Gabon", "Latvia", "Guinea-Bissau", "Bahrain", "Swaziland", "Trinidad and Tobago", "East Timor", "Equatorial Guinea", "Estonia", "Mauritius", "Cyprus", "Djibouti", "Fiji", "Comoros", "Bhutan", "Guyana", "Montenegro", "Solomon Islands", "Luxembourg", "Suriname", "Maldives", "Brunei", "Malta", "Bahamas", "Belize", "Iceland", "French Guiana", "Barbados", "Vanuatu", "Sao Tome and Principe", "Samoa", "Saint Lucia", "Kiribati", "Tonga", "Grenada", "Antigua and Barbuda", "Seychelles", "Andorra", "Dominica", "Marshall Islands", "Monaco", "Liechtenstein", "San Marino", "Palau", "Nauru", "Tuvalu", "Vatican City"  ];  final List<String> _capitals = [ "Beijing", "New Delhi", "Washington D.C.", "Jakarta", "Brasilia", "Islamabad", "Abuja", "Dhaka", "Moscow", "Mexico City", "Tokyo", "Addis Ababa", "Manila", "Cairo", "Hanoi", "Kinshasa", "Berlin", "Tehran", "Ankara", "Bangkok", "London", "Paris", "Rome", "Dodoma3", "Pretoria", "Nay Pyi Taw", "Seoul", "Nairobi", "Bogota", "Madrid", "Buenos Aires", "Kampala", "Kiev", "Algiers", "Khartoum", "Baghdad", "Warsaw", "Ottawa", "Kabul", "Rabat", "Riyadh", "Lima", "Caracas", "Tashkent", "Kuala Lumpur", "Luanda", "Maputo", "Kathmandu", "Accra", "Sanaa", "Antananarivo", "Pyongyang", "Yamoussoukro", "Canberra", "Yaounde", "Taipei", "Niamey", "Colombo", "Ouagadougou", "Bucharest", "Lilongwe", "Bamako", "Astana", "Damascus", "Santiago", "Lusaka", "Guatemala City", "Amsterdam", "Harare", "Quito", "Dakar", "Phnom Penh", "N'Djamena", "Mogadishu", "Conakry", "Juba", "Kigali", "Tunis", "Brussels", "Havana", "Porto Novo", "Bujumbura", "La Paz", "Athens", "Port au Prince", "Santo Domingo", "Prague", "Lisbon", "Stockholm", "Baku", "Amman", "Budapest", "Abu Dhabi", "Minsk", "Tegucigalpa", "Dushanbe", "Belgrade", "Vienna", "Bern", "Tel Aviv1", "Port Moresby", "Lome", "Freetown", "Sofia", "Vientiane", "Asuncion", "Tripoli", "San Salvador", "Managua", "Bishkek", "Beirut", "Ashgabat", "Singapore", "Copenhagen", "Helsinki", "Bratislava", "Brazzaville", "Oslo", "Asmara", "San Jose", "Monrovia", "Muscat", "Dublin", "Wellington", "Bangui", "Nouakchott", "Kuwait City", "Zagreb", "Panama City", "Chisinau", "Tbilisi", "Sarajevo", "Montevideo", "Ulaanbaatar", "Tirana (Tirane)", "Yerevan", "Kingston", "Vilnius", "Doha", "Windhoek", "Gaborone", "Maseru", "Banjul", "Skopje", "Ljubljana", "Libreville", "Riga", "Bissau", "Manama", "Mbabana", "Port of Spain", "Dili", "Malabo", "Tallinn", "Port Louis", "Nicosia", "Djibouti", "Suva", "Moroni", "Thimphu", "Georgetown", "Podgorica", "Honiara", "Luxembourg", "Paramaribo", "Male", "Bandar Seri Begawan", "Valletta", "Nassau", "Belmopan", "Reykjavik", "Cayenne", "Bridgetown", "Port Vila", "Sao Tome", "Apia", "Castries", "Tarawa Atoll", "Nuku'alofa", "Saint George's", "Saint John's", "Victoria", "Andorra la Vella", "Roseau", "Majuro", "Monaco", "Vaduz", "San Marino", "Melekeok", "No official capital", "Funafuti4", "Vatican City"  ];
final List<String> _population = [ "1,415,045,928", "1,354,051,854", "326,766,748", "266,794,980", "210,867,954", "200,813,818", "195,875,237", "166,368,149", "143,964,709", "130,759,074", "127,185,332", "107,534,882", "106,512,074", "99,375,741", "96,491,146", "84,004,989", "82,293,457", "82,011,735", "81,916,871", "69,183,173", "66,573,504", "65,233,271", "59,290,969", "59,091,392", "57,398,421", "53,855,735", "51,164,435", "50,950,879", "49,464,683", "46,397,452", "44,688,864", "44,270,563", "44,009,214", "42,008,054", "41,511,526", "39,339,753", "38,104,832", "36,953,765", "36,373,176", "36,191,805", "33,554,343", "32,551,815", "32,381,221", "32,364,996", "32,042,458", "30,774,205", "30,528,673", "29,624,035", "29,463,643", "28,915,284", "26,262,810", "25,610,672", "24,905,843", "24,772,247", "24,678,234", "23,694,089", "22,311,375", "20,950,041", "19,751,651", "19,580,634", "19,164,728", "19,107,706", "18,403,860", "18,284,407", "18,197,209", "17,609,178", "17,245,346", "17,084,459", "16,913,261", "16,863,425", "16,294,270", "16,245,729", "15,353,184", "15,181,925", "13,052,608", "12,919,053", "12,501,156", "11,659,174", "11,498,519", "11,489,082", "11,485,674", "11,216,450", "11,215,674", "11,142,161", "11,112,945", "10,882,996", "10,625,250", "10,291,196", "9,982,709", "9,923,914", "9,903,802", "9,688,847", "9,541,615", "9,452,113", "9,417,167", "9,107,211", "8,762,027", "8,751,820", "8,544,034", "8,452,841", "8,418,346", "7,990,926", "7,719,729", "7,036,848", "6,961,210", "6,896,908", "6,470,956", "6,411,558", "6,284,757", "6,132,932", "6,093,509", "5,851,466", "5,791,901", "5,754,356", "5,542,517", "5,449,816", "5,399,895", "5,353,363", "5,187,948", "4,953,199", "4,853,516", "4,829,946", "4,803,748", "4,749,598", "4,737,423", "4,540,068", "4,197,128", "4,164,783", "4,162,618", "4,041,065", "3,907,131", "3,503,554", "3,469,551", "3,121,772", "2,934,363", "2,934,152", "2,898,677", "2,876,475", "2,694,849", "2,587,801", "2,333,201", "2,263,010", "2,163,765", "2,085,051", "2,081,260", "2,067,561", "1,929,938", "1,907,268", "1,566,993", "1,391,385", "1,372,598", "1,324,094", "1,313,894", "1,306,788", "1,268,315", "1,189,085", "971,408", "912,241", "832,347", "817,054", "782,225", "629,219", "623,281", "590,321", "568,301", "444,259", "434,076", "432,089", "399,285", "382,444", "337,78", "289,763", "286,388", "282,117", "208,818", "197,695", "179,667", "118,414", "109,008", "108,339", "103,05", "95,235", "76,953", "74,308", "53,167", "38,897", "38,155", "33,557", "21,964", "11,312", "11,287", "801"  ];
List<List<String>> _frontiers = [ [   "Afghanistan",   "Bhutan",   "Myanmar",   "Hong Kong",   "India",   "Kazakhstan",   "Nepal",   "North Korea",   "Kyrgyzstan",   "Laos",   "Macau",   "Mongolia",   "Pakistan" ], ["Bangladesh", "Bhutan", "Myanmar", "China", "Nepal", "Pakistan"], ["Canada", "Mexico"], ["Timor-Leste", "Malaysia", "Papua New Guinea"], [   "Argentina",   "Bolivia",   "Colombia",   "French Guiana",   "Guyana",   "Paraguay",   "Peru",   "Suriname",   "Uruguay",   "Venezuela" ], ["Afghanistan", "China", "India", "Iran"], ["Benin", "Cameroon", "Chad", "Niger"], ["Myanmar", "India"], [   "Azerbaijan",   "Belarus",   "China",   "Estonia",   "Finland",   "Georgia",   "Kazakhstan",   "North Korea",   "Latvia",   "Lithuania",   "Mongolia",   "Norway",   "Poland" ], ["Belize", "Guatemala", "United States"], [], ["Djibouti", "Eritrea", "Kenya", "Somalia", "South Sudan", "Sudan"], [], ["Israel", "Libya", "Palestine", "Sudan"], ["Cambodia", "China", "Laos"], [], [   "Austria",   "Belgium",   "Czechia",   "Denmark",   "France",   "Luxembourg",   "Netherlands",   "Poland",   "Switzerland" ], [   "Afghanistan",   "Armenia",   "Azerbaijan",   "Iraq",   "Pakistan",   "Turkey",   "Turkmenistan" ], [   "Armenia",   "Azerbaijan",   "Bulgaria",   "Georgia",   "Greece",   "Iran",   "Iraq",   "Syria" ], ["Myanmar", "Cambodia", "Laos", "Malaysia"], ["Ireland"], [   "Andorra",   "Belgium",   "Germany",   "Italy",   "Luxembourg",   "Monaco",   "Spain",   "Switzerland" ], [   "Austria",   "France",   "San Marino",   "Slovenia",   "Switzerland",   "Vatican City" ], [   "Burundi",   "DR Congo",   "Kenya",   "Malawi",   "Mozambique",   "Rwanda",   "Uganda",   "Zambia" ], ["Botswana", "Lesotho", "Mozambique", "Namibia", "Eswatini", "Zimbabwe"], ["Bangladesh", "China", "India", "Laos", "Thailand"], ["North Korea"], ["Ethiopia", "Somalia", "South Sudan", "Tanzania", "Uganda"], ["Brazil", "Ecuador", "Panama", "Peru", "Venezuela"], ["Andorra", "France", "Gibraltar", "Portugal", "Morocco"], ["Bolivia", "Brazil", "Chile", "Paraguay", "Uruguay"], ["DR Congo", "Kenya", "Rwanda", "South Sudan", "Tanzania"], [   "Belarus",   "Hungary",   "Moldova",   "Poland",   "Romania",   "Russia",   "Slovakia" ], [   "Tunisia",   "Libya",   "Niger",   "Western Sahara",   "Mauritania",   "Mali",   "Morocco" ], [   "Central African Republic",   "Chad",   "Egypt",   "Eritrea",   "Ethiopia",   "Libya",   "South Sudan" ], ["Iran", "Jordan", "Kuwait", "Saudi Arabia", "Syria", "Turkey"], [   "Belarus",   "Czechia",   "Germany",   "Lithuania",   "Russia",   "Slovakia",   "Ukraine" ], ["United States"], ["Iran", "Pakistan", "Turkmenistan", "Uzbekistan", "Tajikistan", "China"], ["Algeria", "Western Sahara", "Spain"], [   "Iraq",   "Jordan",   "Kuwait",   "Oman",   "Qatar",   "United Arab Emirates",   "Yemen" ], ["Bolivia", "Brazil", "Chile", "Colombia", "Ecuador"], ["Brazil", "Colombia", "Guyana"], ["Afghanistan", "Kazakhstan", "Kyrgyzstan", "Tajikistan", "Turkmenistan"], ["Brunei", "Indonesia", "Thailand"], ["Republic of the Congo", "DR Congo", "Zambia", "Namibia"], ["Malawi", "South Africa", "Eswatini", "Tanzania", "Zambia", "Zimbabwe"], ["China", "India"], ["Burkina Faso", "Ivory Coast", "Togo"], ["Oman", "Saudi Arabia"], [], ["China", "South Korea", "Russia"], [], [], [   "Central African Republic",   "Chad",   "Republic of the Congo",   "Equatorial Guinea",   "Gabon",   "Nigeria" ], [], ["Algeria", "Benin", "Burkina Faso", "Chad", "Libya", "Mali", "Nigeria"], ["India"], ["Benin", "Ivory Coast", "Ghana", "Mali", "Niger", "Togo"], ["Bulgaria", "Hungary", "Moldova", "Serbia", "Ukraine"], ["Mozambique", "Tanzania", "Zambia"], [   "Algeria",   "Burkina Faso",   "Guinea",   "Ivory Coast",   "Mauritania",   "Niger",   "Senegal" ], ["China", "Kyrgyzstan", "Russia", "Turkmenistan", "Uzbekistan"], ["Iraq", "Israel", "Jordan", "Lebanon", "Turkey"], ["Argentina", "Bolivia", "Peru"], [   "Angola",   "Botswana",   "DR Congo",   "Malawi",   "Mozambique",   "Namibia",   "Tanzania",   "Zimbabwe" ], ["Belize", "El Salvador", "Honduras", "Mexico"], ["Belgium", "Germany"], ["Botswana", "Mozambique", "South Africa", "Zambia"], ["Colombia", "Peru"], ["Gambia", "Guinea", "Guinea-Bissau", "Mali", "Mauritania"], ["Laos", "Thailand", "Vietnam"], [   "Cameroon",   "Central African Republic",   "Libya",   "Niger",   "Nigeria",   "Sudan" ], ["Djibouti", "Ethiopia", "Kenya"], [   "Ivory Coast",   "Guinea-Bissau",   "Liberia",   "Mali",   "Senegal",   "Sierra Leone" ], [   "Central African Republic",   "DR Congo",   "Ethiopia",   "Kenya",   "Sudan",   "Uganda" ], ["Burundi", "DR Congo", "Tanzania", "Uganda"], ["Algeria", "Libya"], ["France", "Germany", "Luxembourg", "Netherlands"], [], ["Burkina Faso", "Niger", "Nigeria", "Togo"], ["DR Congo", "Rwanda", "Tanzania"], ["Argentina", "Brazil", "Chile", "Paraguay", "Peru"], ["Albania", "Bulgaria", "Turkey", "Macedonia"], ["Dominican Republic"], ["Haiti"], [], ["Spain"], ["Finland", "Norway"], ["Armenia", "Georgia", "Iran", "Russia", "Turkey"], ["Iraq", "Israel", "Palestine", "Saudi Arabia", "Syria"], [   "Austria",   "Croatia",   "Romania",   "Serbia",   "Slovakia",   "Slovenia",   "Ukraine" ], ["Oman", "Saudi Arabia"], ["Latvia", "Lithuania", "Poland", "Russia", "Ukraine"], ["Guatemala", "El Salvador", "Nicaragua"], ["Afghanistan", "China", "Kyrgyzstan", "Uzbekistan"], [   "Bosnia and Herzegovina",   "Bulgaria",   "Croatia",   "Hungary",   "Kosovo",   "Macedonia",   "Montenegro",   "Romania" ], [   "Czechia",   "Germany",   "Hungary",   "Italy",   "Liechtenstein",   "Slovakia",   "Slovenia",   "Switzerland" ], ["Austria", "France", "Italy", "Liechtenstein", "Germany"], ["Egypt", "Jordan", "Lebanon", "Palestine", "Syria"], ["Indonesia"], ["Benin", "Burkina Faso", "Ghana"], ["Guinea", "Liberia"], ["Greece", "Macedonia", "Romania", "Serbia", "Turkey"], ["Myanmar", "Cambodia", "China", "Thailand", "Vietnam"], ["Argentina", "Bolivia", "Brazil"], ["Algeria", "Chad", "Egypt", "Niger", "Sudan", "Tunisia"], ["Guatemala", "Honduras"], ["Costa Rica", "Honduras"], ["China", "Kazakhstan", "Tajikistan", "Uzbekistan"], ["Israel", "Syria"], ["Afghanistan", "Iran", "Kazakhstan", "Uzbekistan"], [], ["Germany"], ["Norway", "Sweden", "Russia"], ["Austria", "Czechia", "Hungary", "Poland"], [], ["Finland", "Sweden", "Russia"], ["Djibouti", "Ethiopia", "Sudan"], ["Nicaragua", "Panama"], ["Guinea", "Ivory Coast", "Sierra Leone"], ["Saudi Arabia", "United Arab Emirates", "Yemen"], ["United Kingdom"], [], [   "Cameroon",   "Chad",   "DR Congo",   "Republic of the Congo",   "South Sudan",   "Sudan" ], ["Algeria", "Mali", "Senegal", "Western Sahara"], ["Iraq", "Saudi Arabia"], ["Bosnia and Herzegovina", "Hungary", "Montenegro", "Serbia", "Slovenia"], ["Colombia", "Costa Rica"], ["Romania", "Ukraine"], ["Armenia", "Azerbaijan", "Russia", "Turkey"], ["Croatia", "Montenegro", "Serbia"], ["Argentina", "Brazil"], ["China", "Russia"], ["Montenegro", "Greece", "Macedonia", "Kosovo"], ["Azerbaijan", "Georgia", "Iran", "Turkey"], [], ["Belarus", "Latvia", "Poland", "Russia"], ["Saudi Arabia"], ["Angola", "Botswana", "South Africa", "Zambia"], ["Namibia", "South Africa", "Zambia", "Zimbabwe"], ["South Africa"], ["Senegal"], ["Albania", "Bulgaria", "Greece", "Kosovo", "Serbia"], ["Austria", "Croatia", "Italy", "Hungary"], ["Cameroon", "Republic of the Congo", "Equatorial Guinea"], ["Belarus", "Estonia", "Lithuania", "Russia"], ["Guinea", "Senegal"], [], [], [], [], ["Cameroon", "Gabon"], ["Latvia", "Russia"], [], [], ["Eritrea", "Ethiopia", "Somalia"], [], [], ["China", "India"], ["Brazil", "Suriname", "Venezuela"], ["Albania", "Bosnia and Herzegovina", "Croatia", "Kosovo", "Serbia"], [], ["Belgium", "France", "Germany"], ["Brazil", "French Guiana", "Guyana"], [], ["Malaysia"], [], [], ["Guatemala", "Mexico"], [], ["Brazil", "Suriname"], [], [], [], [], [], [], [], [], [], [], ["France", "Spain"], [], [], ["France"], ["Austria", "Switzerland"], ["Italy"], [], [], [], ["Italy"],  ];
   */
