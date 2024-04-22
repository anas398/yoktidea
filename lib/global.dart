class Global {

  static final Global _instance = Global._internal();

  // passes the instantiation to the _instance object
  factory Global() => _instance;

  //initialize variables in here
  Global._internal() {
    _wstrPhoneNumber= '';
    _wstrcountryCode= '';
    _wstrole= '';
    _wstrtoken= '';


  }
  var _wstrPhoneNumber  = '';
  var _wstrcountryCode  = '';
  var _wstrtoken  = '';
  var _wstrole  = '';


  get wstrPhoneNumber => _wstrPhoneNumber;
  set wstrPhoneNumber(value) {
    _wstrPhoneNumber = value;
  }


  get wstrcountryCode => _wstrcountryCode;
  set wstrcountryCode(value) {
    _wstrcountryCode = value;
  }

  get wstrole => _wstrole;
  set wstrole(value) {
    _wstrole = value;
  }
  get wstrtoken => _wstrtoken;
  set wstrtoken(value) {
    _wstrtoken = value;
  }


}