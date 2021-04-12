import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:testpro/home_page.dart';
import 'package:flutter_native_image/flutter_native_image.dart';


PickedFile _photo;
String photoBase64;

class UpdateUsers extends StatefulWidget {
  final String salutation;
  final String firstName;
  final String lastName;
  final String companyName;
  final String contactEmail;
  final String contactNo;
  final String website;
  final String openingBalance;
  final String facebook;
  final String twitter;
  final String attention;
  final String countryRegion;
  final String street1;
  final String city;
  final String state;
  final String zipCode;
  final String phone1;
  final String fax;
  final String cfirstName;
  final String clastName;
  final String emailAddress;
  final String mobile;
  final String workPhone;
  //final String remarks;
  final String uploadDocument;

  const UpdateUsers({
    Key key,
    this.salutation,
    this.firstName,
    this.lastName,
    this.companyName,
    this.contactEmail,
    this.contactNo,
    this.website,
    this.openingBalance,
    this.facebook,
    this.twitter,
    this.attention,
    this.countryRegion,
    this.street1,
    this.city,
    this.state,
    this.zipCode,
    this.phone1,
    this.fax,
    this.cfirstName,
    this.clastName,
    this.emailAddress,
    this.mobile,
    this.workPhone,
    //this.title
    //this.remarks,
    this.uploadDocument,
  }) : super(key: key);

  //final String title;

  @override
  _UpdateUsersState createState() => _UpdateUsersState();
}

class _UpdateUsersState extends State<UpdateUsers> {
// File _image;
  final picker = ImagePicker();

  final salutation = new TextEditingController();
  final firstName = new TextEditingController();
  final lastName = new TextEditingController();
  final companyName = new TextEditingController();
  final contactEmail = new TextEditingController();
  final contactNo = new TextEditingController();
  final website = new TextEditingController();
  final openingBalance = new TextEditingController();
  final facebook = new TextEditingController();
  final twitter = new TextEditingController();
  final attention = new TextEditingController();
  final countryRegion = new TextEditingController();
  final street1 = new TextEditingController();
  final city = new TextEditingController();
  final state = new TextEditingController();
  final zipCode = new TextEditingController();
  final phone1 = new TextEditingController();
  final fax = new TextEditingController();
  final cfirstName = new TextEditingController();
  final clastName = new TextEditingController();
  final emailAddress = new TextEditingController();
  final mobile = new TextEditingController();
  final workPhone = new TextEditingController();
  //final remarks = new TextEditingController();
  final uploadDocument = new TextEditingController();

  File imageResized;

  Future getImage(ImageSource source) async {
    var photo = await picker.getImage(source: ImageSource.gallery);
    imageResized = await FlutterNativeImage.compressImage(
      photo.path,
    );
    setState(() {
      _photo = photo;
      List<int> imageBytes = imageResized.readAsBytesSync();
      photoBase64 = base64Encode(imageBytes);
      print(photoBase64);
    });
  }

  void selectImage() {
    getImage(ImageSource.gallery);
  }
  bool _valsalutation = false;
  bool _valfirstName = false;
  bool _vallastName = false;
  bool _valcompanyName = false;
  bool _valcontactEmail = false;
  bool _valcontactNo = false;
  bool _valwebsite = false;
  bool _valopeningBalance = false;
  bool _valfacebook = false;
  bool _valtwitter = false;
  bool _valattention = false;
  bool _valcountryRegion = false;
  bool _valstreet1 = false;
  bool _valcity = false;
  bool _valstate = false;
  bool _valzipCode = false;
  bool _valphone1 = false;
  bool _valfax = false;
  bool _valcfirstName = false;
  bool _valclastName = false;
  bool _valemailAddress = false;
  bool _valmobile = false;
  bool _valworkPhone = false;
   bool _valuploadDocument = false;
  //bool _valremarks = false;

  Future _updateDetails(
    String salutation,
    String firstName,
    String lastName,
    String companyName,
    String contactEmail,
    String contactNo,
    String website,
    String openingBalance,
    String facebook,
    String twitter,
    String attention,
    String countryRegion,
    String street1,
    String city,
    String state,
    String zipCode,
    String phone1,
    String fax,
    String cfirstName,
    String clastName,
    String emailAddress,
    String mobile,
    String workPhone,
    //String remarks,
    String uploadDocument,
  ) async {
//..................................

//..........................

    var url =
        "http://192.168.42.162:3000/api/client/mobile/60460a1d5d3eae18b06a4c26";

    final response = await http.put(url, body: {
      "salutation": salutation,
      "firstName": firstName,
      "lastName": lastName,
      "companyName": companyName,
      "contactEmail": contactEmail,
      "contactNo": contactNo,
      "website": website,
      "openingBalance": openingBalance,
      "facebook": facebook,
      "twitter": twitter,
      "attention": attention,
      "countryRegion": countryRegion,
      "street1": street1,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "phone1": phone1,
      "fax": fax,
       "cfirstName": cfirstName,
      "clastName": clastName,
      "emailAddress": emailAddress,
      "mobile": mobile,
      "workPhone": workPhone,
      //"remarks": remarks,
      //  {'TEST': '53'},
      "uploadDocument": uploadDocument,
    });
    var res = response.body;
    if (response.statusCode == 200) {
      // Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print("Error :" + res);
    }
  }

  @override
  void dispose() {
    salutation.dispose();
    firstName.dispose();
    lastName.dispose();
    companyName.dispose();
    contactEmail.dispose();
    contactNo.dispose();
    website.dispose();
    openingBalance.dispose();
    facebook.dispose();
    twitter.dispose();
    attention.dispose();
    countryRegion.dispose();
    street1.dispose();
    city.dispose();
    state.dispose();
    zipCode.dispose();
    phone1.dispose();
    fax.dispose();
    cfirstName.dispose();
    clastName.dispose();
    emailAddress.dispose();
    mobile.dispose();
    workPhone.dispose();
    //remarks.dispose();
    //uploadDocument.dispose();

    super.dispose();
  }

  @override
  void initState() {
    salutation.text = widget.salutation;
    firstName.text = widget.firstName;
    lastName.text = widget.lastName;
    companyName.text = widget.companyName;
    contactEmail.text = widget.contactEmail;
    contactNo.text = widget.contactNo;
    website.text = widget.website;
    openingBalance.text = widget.openingBalance;
    facebook.text = widget.facebook;
    twitter.text = widget.twitter;
    attention.text = widget.attention;
    countryRegion.text = widget.countryRegion;
    street1.text = widget.street1;
    city.text = widget.city;
    state.text = widget.state;
    zipCode.text = widget.zipCode;
    phone1.text = widget.phone1;
    fax.text = widget.fax;
    cfirstName.text = widget.cfirstName;
    clastName.text = widget.clastName;
    emailAddress.text = widget.emailAddress;
    mobile.text = widget.mobile;
    workPhone.text = widget.workPhone;
    //remarks.text = widget.remarks;
    uploadDocument.text = widget.uploadDocument;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Salutation',
                    labelText: 'Salutation',
                    errorText: _valsalutation
                        ? "Salutation Name Can't be Empty"
                        : null,
                  ),
                  controller: salutation,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
                    errorText:
                        _valfirstName ? "First Name Can't be Empty" : null,
                  ),
                  controller: firstName,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                    errorText: _vallastName ? "Last Name Can't be Empty" : null,
                  ),
                  controller: lastName,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Company Name',
                    labelText: 'Company Name ',
                    errorText: _valcompanyName ? "Name Can't be Empty" : null,
                  ),
                  controller: companyName,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contact Email',
                    labelText: 'Contact Email',
                    errorText: _valcontactEmail ? "Email Can't be Empty" : null,
                  ),
                  controller: contactEmail,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contact No',
                    labelText: 'Contact No ',
                    errorText: _valcontactNo ? "No Can't be Empty" : null,
                  ),
                  controller: contactNo,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Website',
                    labelText: 'Website ',
                    errorText: _valwebsite ? "Site Can't be Empty" : null,
                  ),
                  controller: website,
                ),
                DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(children: [
                      TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.blue,
                        tabs: [
                          Tab(
                            text: 'Other Details',
                          ),
                          Tab(text: 'Address'),
                          Tab(text: 'Contact Persons'),
                          //Tab(text: 'Remarks'),
                          Tab(text: 'Uploads'),
                        ],
                      ),
                      Container(
                        height: 500.0,
                        child: TabBarView(children: [
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Opening Balence',
                                  labelText: 'Opening Balence ',
                                  errorText: _valopeningBalance
                                      ? "Balence Can't be Empty"
                                      : null,
                                ),
                                controller: openingBalance,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Facebook',
                                  labelText: 'Facebook ',
                                  errorText:
                                      _valfacebook ? "Id Can't be Empty" : null,
                                ),
                                controller: facebook,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Twitter',
                                  labelText: 'Twitter ',
                                  errorText:
                                      _valtwitter ? "Id Can't be Empty" : null,
                                ),
                                controller: twitter,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Attention',
                                  labelText: 'Attention ',
                                  errorText: _valattention
                                      ? "Attention Can't be Empty"
                                      : null,
                                ),
                                controller: attention,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Country/Region',
                                  labelText: 'Country Region ',
                                  errorText: _valcountryRegion
                                      ? "CountryRegion Can't be Empty"
                                      : null,
                                ),
                                controller: countryRegion,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Street1',
                                  labelText: 'Street1 ',
                                  errorText: _valstreet1
                                      ? "Street Can't be Empty"
                                      : null,
                                ),
                                controller: street1,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'City',
                                  labelText: 'City ',
                                  errorText:
                                      _valcity ? "City Can't be Empty" : null,
                                ),
                                controller: city,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'State',
                                  labelText: 'State ',
                                  errorText:
                                      _valstate ? "State Can't be Empty" : null,
                                ),
                                controller: state,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Zip Code',
                                  labelText: 'Zip Code ',
                                  errorText: _valzipCode
                                      ? "Zip Code Can't be Empty"
                                      : null,
                                ),
                                controller: zipCode,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  labelText: 'Phone ',
                                  errorText: _valphone1
                                      ? "Phone Can't be Empty"
                                      : null,
                                ),
                                controller: phone1,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Fax',
                                  labelText: 'Fax',
                                  errorText:
                                      _valfax ? "Fax Can't be Empty" : null,
                                ),
                                controller: fax,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  labelText: 'First Name ',
                                  errorText: _valcfirstName
                                      ? "Name Can't be Empty"
                                      : null,
                                ),
                                controller: cfirstName,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  labelText: 'Last Name ',
                                  errorText: _valclastName
                                      ? "Name Can't be Empty"
                                      : null,
                                ),
                                controller: clastName,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  labelText: 'Email Address ',
                                  errorText: _valemailAddress
                                      ? "Email Can't be Empty"
                                      : null,
                                ),
                                controller: emailAddress,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Mobile',
                                  labelText: 'Mobile ',
                                  errorText: _valmobile
                                      ? "Mobile Can't be Empty"
                                      : null,
                                ),
                                controller: mobile,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Work Phone',
                                  labelText: 'Work Phone ',
                                  errorText: _valworkPhone
                                      ? "Phone Can't be Empty"
                                      : null,
                                ),
                                controller: workPhone,
                              ),
                            ],
                          ),
                        
                          ListView(
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextField(
                                decoration: InputDecoration(
                                  hintText: 'Upload',
                                  labelText: 'Upload ',
                                  errorText: _valuploadDocument
                                      ? "Phone Can't be Empty"
                                      : null,
                                ),
                                controller: uploadDocument,
                              ),
                                    imageResized == null
                                        ? Container()
                                        : Image.file(imageResized),
                                    FloatingActionButton(
                                      onPressed: selectImage,
                                      tooltip: 'selectImage',
                                      child: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          )
                        ]),
                      )
                    ])),
                ButtonBar(
                  children: [
                    RaisedButton(
                      color: Colors.green,
                      child: Text('Update'),
                      onPressed: () {
                        setState(() {
                          salutation.text.isEmpty
                              ? _valsalutation = true
                              : _valsalutation = false;
                          firstName.text.isEmpty
                              ? _valfirstName = true
                              : _valfirstName = false;
                          lastName.text.isEmpty
                              ? _vallastName = true
                              : _vallastName = false;

                          companyName.text.isEmpty
                              ? _valcompanyName = true
                              : _valcompanyName = false;
                          contactEmail.text.isEmpty
                              ? _valcontactEmail = true
                              : _valcontactEmail = false;
                          contactNo.text.isEmpty
                              ? _valcontactNo = true
                              : _valcontactNo = false;
                          website.text.isEmpty
                              ? _valwebsite = true
                              : _valwebsite = false;

                          openingBalance.text.isEmpty
                              ? _valopeningBalance = true
                              : _valopeningBalance = false;

                          facebook.text.isEmpty
                              ? _valfacebook = true
                              : _valfacebook = false;
                          twitter.text.isEmpty
                              ? _valtwitter = true
                              : _valtwitter = false;

                          attention.text.isEmpty
                              ? _valattention = true
                              : _valattention = false;
                          countryRegion.text.isEmpty
                              ? _valcountryRegion = true
                              : _valcountryRegion = false;
                          street1.text.isEmpty
                              ? _valstreet1 = true
                              : _valstreet1 = false;
                          state.text.isEmpty
                              ? _valstate = true
                              : _valstate = false;

                          city.text.isEmpty
                              ? _valcity = true
                              : _valcity = false;

                          zipCode.text.isEmpty
                              ? _valzipCode = true
                              : _valzipCode = false;
                          phone1.text.isEmpty
                              ? _valphone1 = true
                              : _valphone1 = false;
                          fax.text.isEmpty ? _valfax = true : _valfax = false;

                          cfirstName.text.isEmpty
                              ? _valcfirstName = true
                              : _valcfirstName = false;

                          clastName.text.isEmpty
                              ? _valclastName = true
                              : _valclastName = false;

                          emailAddress.text.isEmpty
                              ? _valemailAddress = true
                              : _valemailAddress = false;
                          mobile.text.isEmpty
                              ? _valmobile = true
                              : _valmobile = false;
                          workPhone.text.isEmpty
                              ? _valworkPhone = true
                              : _valworkPhone = false;
                          // remarks.text.isEmpty
                          // ? _valremarks = true
                          // : _valremarks = false;
                           uploadDocument.text.isEmpty
                           ? _valuploadDocument= true
                           :_valuploadDocument = false;

                          if (_valsalutation == false &&
                                  _valfirstName == false &&
                                  _vallastName == false &&
                                  _valcompanyName == false &&
                                  _valcontactEmail == false &&
                                  _valcontactNo == false &&
                                  _valwebsite == false &&
                                  _valopeningBalance == false &&
                                  _valfacebook == false &&
                                  _valtwitter == false &&
                                  _valattention == false &&
                                  _valstreet1 == false &&
                                  _valstate == false &&
                                  _valcity == false &&
                                  _valcountryRegion == false &&
                                  _valphone1 == false &&
                                  _valzipCode == false &&
                                  _valfax == false &&
                                  _valcfirstName == false &&
                                  _valclastName == false &&
                                  _valemailAddress == false &&
                                  _valmobile == false &&
                                  _valworkPhone == false &&
                                 _valuploadDocument == false
                              ) {
                            _updateDetails(
                              salutation.text,
                              firstName.text,
                              lastName.text,
                              companyName.text,
                              contactEmail.text,
                              contactNo.text,
                              website.text,
                              openingBalance.text,
                              facebook.text,
                              twitter.text,
                              attention.text,
                              countryRegion.text,
                              street1.text,
                              city.text,
                              state.text,
                              zipCode.text,
                              phone1.text,
                              fax.text,
                              cfirstName.text,
                              clastName.text,
                              emailAddress.text,
                              mobile.text,
                              workPhone.text,
                              //remarks.text,
                              uploadDocument.text,
                            );
                          }
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.red,
                      child: Text('Delete'),
                      onPressed: () {
                        // contactEmail.clear();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
