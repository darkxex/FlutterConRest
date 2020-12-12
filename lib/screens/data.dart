import 'package:flutter/material.dart';
import 'package:flutter_app/http/datospasados.dart';
import 'package:flutter_app/screens/integran.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/screens/testchart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class Data extends StatefulWidget {
  Data({Key key}) : super(key: key);

  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {

  String id;
  String CountryOne,CountryOneCode;
  String CountryTwo, CountryTwoCode;
  String Yearinitial,YearFinal;

  Map info = Map();

 // TextEditingController controllerId = TextEditingController(text:'1');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = 'gdp';
    CountryOne = 'Chile';
    CountryOneCode = 'CL';
    CountryTwo = 'Afghanistan';
    CountryTwoCode = 'AF';
    Yearinitial = '2000';
    YearFinal = '2006';
  }
  String dropdownValue = 'dbi';
bool execu = false;
  @override

  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Graficador de Indicadores'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.1),
        child: Column(
          children: <Widget>[

            SizedBox(height:  size.height * 0.03,),
            Text("Indicador:"),


            DropdownButton(
              value: id,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  id = newValue;

                });
              },
              items: <String>['dbi', 'gdp', 'ifl', 'iva', 'prf','smi','tda','tsc']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),

            ),
            Text("País Uno:"),
            DropdownButton(
              value: CountryOne,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                 CountryOne = newValue;
                  var namepais = ['Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Aruba','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','British Virgin Islands','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Cayman Islands','Central African Republic','Chad','Channel Islands','Chile','China','Colombia','Comoros','Congo Dem. Rep.','Congo Rep.','Costa Rica','Cote dIvoire','Croatia','Cuba','Curacao','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt Arab Rep.','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Faroe Islands','Fiji','Finland','France','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Greenland','Grenada','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong SAR China','Hungary','Iceland','India','Indonesia','Iran Islamic Rep.','Iraq','Ireland','Isle of Man','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea Dem.','Korea Rep.','Kosovo','Kuwait','Kyrgyz Republic','Lao PDR','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Macao SAR China','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia Fed. Sts.','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Northern Mariana Islands','Norway','Oman','Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Romania','Russian Federation','Rwanda','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Sint Maarten (Dutch part)','Slovak Republic','Slovenia','Solomon Islands','Somalia','South Africa','South Sudan','Spain','Sri Lanka','St. Kitts and Nevis','St. Lucia','St. Martin (French part)','St. Vincent and the Grenadines','Sudan','Suriname','Sweden','Switzerland','Syrian Arab Republic','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Turks and Caicos Islands','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','United States','Uruguay','Uzbekistan','Vanuatu','Venezuela','Vietnam','Virgin Islands (U.S.)','West Bank and Gaza','Yemen Rep.','Zambia','Zimbabwe'];
                  var codigopaises = ['AF','AL','DZ','AS','AD','AO','AG','AR','AM','AW','AU','AT','AZ','BS','BH','BD','BB','BY','BE','BZ','BJ','BM','BT','BO','BA','BW','BR','VG','BN','BG','BF','BI','CV','KH','CM','CA','KY','CF','TD','No hay datos.','CL','CN','CO','KM','CD','CG','CR','CI','HR','CU','CW','CY','CZ','DK','DJ','DM','DO','EC','AE','SV','GQ','ER','EE','SZ','ET','FO','FJ','FI','FR','PF','GA','GM','GE','DE','GH','GI','GR','GL','GD','GU','GT','GN','GW','GY','HT','HN','HK','HU','IS','IN','ID','IR','IQ','IE','IM','IL','IT','JM','JP','JO','KZ','KE','KI','KP','KR','No hay datos.','KW','KG','LA','LV','LB','LS','LR','LY','LI','LT','LU','MO','MG','MW','MY','MV','ML','MT','MH','MQ','MU','MX','FM','MD','MC','MN','ME','MA','MZ','MM','NA','NR','NP','NL','NC','NZ','NI','NE','NG','MK','MP','NO','OM','PK','PW','PA','PG','PY','PE','PH','PL','PT','PR','QA','RO','RU','RW','WS','SM','ST','SA','SN','RS','SC','SL','SG','MF','SK','SI','SB','SO','ZA','SS','ES','LK','KN','LC','MF','VC','SD','SR','SE','CH','SY','TJ','TZ','TH','TL','TG','TO','TT','TN','TR','TM','TC','TV','UG','UA','AE','GB','US','UY','UZ','VU','VE','VN','VI','No hay datos.','YE','ZM','ZW'];
                  for(int x = 0; x<namepais.length;x++ )
                   {
                     if (namepais[x].contains(newValue))
                       {print(x);
                        print (codigopaises[x]);
                        CountryOneCode = codigopaises[x];
                       }

                   }

                  print(CountryOne);
                });
              },
              items: <String>['Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Aruba','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','British Virgin Islands','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Cayman Islands','Central African Republic','Chad','Channel Islands','Chile','China','Colombia','Comoros','Congo Dem. Rep.','Congo Rep.','Costa Rica','Cote dIvoire','Croatia','Cuba','Curacao','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt Arab Rep.','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Faroe Islands','Fiji','Finland','France','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Greenland','Grenada','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong SAR China','Hungary','Iceland','India','Indonesia','Iran Islamic Rep.','Iraq','Ireland','Isle of Man','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea Dem.','Korea Rep.','Kosovo','Kuwait','Kyrgyz Republic','Lao PDR','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Macao SAR China','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia Fed. Sts.','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Northern Mariana Islands','Norway','Oman','Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Romania','Russian Federation','Rwanda','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Sint Maarten (Dutch part)','Slovak Republic','Slovenia','Solomon Islands','Somalia','South Africa','South Sudan','Spain','Sri Lanka','St. Kitts and Nevis','St. Lucia','St. Martin (French part)','St. Vincent and the Grenadines','Sudan','Suriname','Sweden','Switzerland','Syrian Arab Republic','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Turks and Caicos Islands','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','United States','Uruguay','Uzbekistan','Vanuatu','Venezuela','Vietnam','Virgin Islands (U.S.)','West Bank and Gaza','Yemen Rep.','Zambia','Zimbabwe']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),

            ),
            Text("País Dos:"),
            DropdownButton(
              value: CountryTwo,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  CountryTwo = newValue;
                  var namepais = ['Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Aruba','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','British Virgin Islands','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Cayman Islands','Central African Republic','Chad','Channel Islands','Chile','China','Colombia','Comoros','Congo Dem. Rep.','Congo Rep.','Costa Rica','Cote dIvoire','Croatia','Cuba','Curacao','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt Arab Rep.','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Faroe Islands','Fiji','Finland','France','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Greenland','Grenada','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong SAR China','Hungary','Iceland','India','Indonesia','Iran Islamic Rep.','Iraq','Ireland','Isle of Man','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea Dem.','Korea Rep.','Kosovo','Kuwait','Kyrgyz Republic','Lao PDR','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Macao SAR China','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia Fed. Sts.','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Northern Mariana Islands','Norway','Oman','Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Romania','Russian Federation','Rwanda','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Sint Maarten (Dutch part)','Slovak Republic','Slovenia','Solomon Islands','Somalia','South Africa','South Sudan','Spain','Sri Lanka','St. Kitts and Nevis','St. Lucia','St. Martin (French part)','St. Vincent and the Grenadines','Sudan','Suriname','Sweden','Switzerland','Syrian Arab Republic','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Turks and Caicos Islands','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','United States','Uruguay','Uzbekistan','Vanuatu','Venezuela','Vietnam','Virgin Islands (U.S.)','West Bank and Gaza','Yemen Rep.','Zambia','Zimbabwe'];
                  var codigopaises = ['AF','AL','DZ','AS','AD','AO','AG','AR','AM','AW','AU','AT','AZ','BS','BH','BD','BB','BY','BE','BZ','BJ','BM','BT','BO','BA','BW','BR','VG','BN','BG','BF','BI','CV','KH','CM','CA','KY','CF','TD','No hay datos.','CL','CN','CO','KM','CD','CG','CR','CI','HR','CU','CW','CY','CZ','DK','DJ','DM','DO','EC','AE','SV','GQ','ER','EE','SZ','ET','FO','FJ','FI','FR','PF','GA','GM','GE','DE','GH','GI','GR','GL','GD','GU','GT','GN','GW','GY','HT','HN','HK','HU','IS','IN','ID','IR','IQ','IE','IM','IL','IT','JM','JP','JO','KZ','KE','KI','KP','KR','No hay datos.','KW','KG','LA','LV','LB','LS','LR','LY','LI','LT','LU','MO','MG','MW','MY','MV','ML','MT','MH','MQ','MU','MX','FM','MD','MC','MN','ME','MA','MZ','MM','NA','NR','NP','NL','NC','NZ','NI','NE','NG','MK','MP','NO','OM','PK','PW','PA','PG','PY','PE','PH','PL','PT','PR','QA','RO','RU','RW','WS','SM','ST','SA','SN','RS','SC','SL','SG','MF','SK','SI','SB','SO','ZA','SS','ES','LK','KN','LC','MF','VC','SD','SR','SE','CH','SY','TJ','TZ','TH','TL','TG','TO','TT','TN','TR','TM','TC','TV','UG','UA','AE','GB','US','UY','UZ','VU','VE','VN','VI','No hay datos.','YE','ZM','ZW'];
                  for(int x = 0; x<namepais.length;x++ )
                  {
                    if (namepais[x].contains(newValue))
                    {print(x);
                    print (codigopaises[x]);
                    CountryTwoCode = codigopaises[x];
                    }

                  }

                  print(CountryTwo);
                });
              },
              items: <String>['Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Aruba','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','British Virgin Islands','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Cayman Islands','Central African Republic','Chad','Channel Islands','Chile','China','Colombia','Comoros','Congo Dem. Rep.','Congo Rep.','Costa Rica','Cote dIvoire','Croatia','Cuba','Curacao','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt Arab Rep.','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Faroe Islands','Fiji','Finland','France','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Greenland','Grenada','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong SAR China','Hungary','Iceland','India','Indonesia','Iran Islamic Rep.','Iraq','Ireland','Isle of Man','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea Dem.','Korea Rep.','Kosovo','Kuwait','Kyrgyz Republic','Lao PDR','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Macao SAR China','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia Fed. Sts.','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Northern Mariana Islands','Norway','Oman','Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Romania','Russian Federation','Rwanda','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Sint Maarten (Dutch part)','Slovak Republic','Slovenia','Solomon Islands','Somalia','South Africa','South Sudan','Spain','Sri Lanka','St. Kitts and Nevis','St. Lucia','St. Martin (French part)','St. Vincent and the Grenadines','Sudan','Suriname','Sweden','Switzerland','Syrian Arab Republic','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Turks and Caicos Islands','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','United States','Uruguay','Uzbekistan','Vanuatu','Venezuela','Vietnam','Virgin Islands (U.S.)','West Bank and Gaza','Yemen Rep.','Zambia','Zimbabwe']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),

            ),
            Text("Inicio:"),
            DropdownButton(
              value: Yearinitial,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  Yearinitial = newValue;

                  print(Yearinitial);
                });
              },
              items: <String>['1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),

            ),
            Text("Termino:"),
            DropdownButton(
              value: YearFinal,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  YearFinal = newValue;

                  print(YearFinal);
                });
              },
              items: <String>['1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),

            ),
            SizedBox(height: size.height * 0.1,),



            RaisedButton(
              color: Colors.blue, 
              textColor: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,  vertical: 15),
                child: Text('Graficar'),),
              onPressed: () async {


                try{
                     if ( int.parse(Yearinitial) > int.parse(YearFinal) )
                       {String tempFinal = YearFinal;
                       String tempInitial = Yearinitial;
                         Yearinitial = tempFinal;
                         YearFinal = tempInitial;
                       }
                  http.Response response = await http.post('http://201.214.18.28:8080/Rest/webresources/api/v1/indicators/info', headers: { 'Content-Type': 'application/json',"X-API-KEY": "ZXN0b3lkZW50cm9oYWNrZXJtYW4=","X-API-APP": "admin"},
                    body: jsonEncode(<String, String>{
                      "countryCode": CountryOneCode,
                      "indicatorCode": id,
                      "startYear": Yearinitial,
                      "endYear": YearFinal
                    }),);

                  http.Response response2 = await http.post('http://201.214.18.28:8080/Rest/webresources/api/v1/indicators/info', headers: { 'Content-Type': 'application/json',"X-API-KEY": "ZXN0b3lkZW50cm9oYWNrZXJtYW4=","X-API-APP": "admin"},
                    body: jsonEncode(<String, String>{
                      "countryCode": CountryTwoCode,
                      "indicatorCode": id,
                      "startYear": Yearinitial,
                      "endYear": YearFinal
                    }),);
                  //si es codigo http es igual a 200 la petición fue exitosa y retornamos el JSON, en este caso un MAP
                  if(response.statusCode == 200 && response2.statusCode == 200)
                  { print( (response.body)+ "splitcode"+ (response2.body));
                  var year = new List();
                  var value = new List();
                  var year2 = new List();
                  var value2 = new List();
                  data1.clear();
                  data2.clear();
                  year.clear();
                  year2.clear();
                  value.clear();
                  value2.clear();
                  String datosoriginal =(response.body)+ "splitcode"+ (response2.body);
                  String datos = datosoriginal.substring(0,datosoriginal.indexOf("splitcode"));
                  String datos2 = datosoriginal.substring(datosoriginal.indexOf("splitcode"),datosoriginal.length);

                  int initval = 0;
                  int lastval = 0;
                  int tempvalue1, tempvalue2;

                  while (initval != -1 || lastval != -1)
                  {

                    initval =  datos.indexOf("year\":\"",lastval);

                    if (initval == -1)
                      break;
                    tempvalue1 = datos.lastIndexOf("value\"",initval);

                    tempvalue2 = datos.indexOf("\",",tempvalue1);
                    String valueofyear = datos.substring(tempvalue1 + 8,tempvalue2);
                    lastval = datos.indexOf("\"}",initval);

                    String temp = datos.substring(initval + 7 ,lastval);

                    year.add(temp);
                    value.add(valueofyear);
                    if (!valueofyear.contains("No hay datos."))
                    {
                      if (id.contains("tsc"))
                       valueofyear = valueofyear.replaceAll(".", "");

                        data1.add(TimeSeriesSales(new DateTime(int.parse(temp), 0, 0), double.parse(valueofyear)));
                    }


                  }

                  initval = 0;
                  lastval = 0;

                  while (initval != -1 || lastval != -1)
                  {

                    initval =  datos2.indexOf("year\":\"",lastval);

                    if (initval == -1)
                      break;
                    tempvalue1 = datos2.lastIndexOf("value\"",initval);

                    tempvalue2 = datos2.indexOf("\",",tempvalue1);
                    String valueofyear = datos2.substring(tempvalue1 + 8,tempvalue2);
                    lastval = datos2.indexOf("\"}",initval);

                    String temp = datos2.substring(initval + 7 ,lastval);

                    year2.add(temp);
                    value2.add(valueofyear);
                    if (!valueofyear.contains("No hay datos."))
                   {
                     if (id.contains("tsc"))
                       valueofyear = valueofyear.replaceAll(".", "");
                    data2.add(TimeSeriesSales(new DateTime(int.parse(temp), 0, 0), double.parse(valueofyear)));

                   }
                  }
                  print (year.toString() + " " + value.toString() + "\n"+ year2.toString() + " " + value2.toString());
                  final data = datospasados(year,year2,value,value2, CountryOneCode + ("(Blue) / ") + CountryTwoCode + "(Red)" );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimpleTimeSeriesChart(   graficofinal(),
                      // Disable animations for image tests.
                      animate: false,
                      datas: data,
                    )),
                  );

                  }
                  else
                  { print ("error" +response.body); }

                } catch (e) {


                }








                },
            ),
            SizedBox(height: size.height * 0.1,),
            IconButton(
              icon: Image.asset('assets/images/integrantes.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => integran()),
                );

              },
            ),





          ],
        ),

      ),
    );

  }


  List<TimeSeriesSales>  data1 = [
    new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
    new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
    new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
    new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
  ];
  List<TimeSeriesSales>  data2 = [
    new TimeSeriesSales(new DateTime(2017, 9, 19), 23),
    new TimeSeriesSales(new DateTime(2017, 9, 26), 27),
    new TimeSeriesSales(new DateTime(2017, 10, 3), 121),
    new TimeSeriesSales(new DateTime(2017, 10, 10), 78),
  ];


   List<charts.Series<TimeSeriesSales, DateTime>> graficofinal() {



    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'graf1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data1,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'graf2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data2,
      )
    ];
  }


}

class TimeSeriesSales {
  DateTime time;
  double sales;

  TimeSeriesSales(this.time, this.sales);
}