* When Store user data to realtime database 
* use firebase rule - >  {
  "rules": {
  ".read": "auth !=null",
  ".write": "auth !=null",
  }
  }