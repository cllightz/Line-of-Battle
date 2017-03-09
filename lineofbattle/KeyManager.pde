class KeyManager {
  boolean w;
  boolean a;
  boolean s;
  boolean d;
  
  KeyManager() {
    w = false;
    a = false;
    s = false;
    d = false;
  }
  
  void enable( char k ) {
    switch ( k ) {
      case 'w':
      case 'W':
        w = true;
        break;
        
      case 'a':
      case 'A':
        a = true;
        break;
        
      case 's':
      case 'S':
        s = true;
        break;
        
      case 'd':
      case 'D':
        d = true;
        break;
    }
  }
  
  void disable( char k ) {
    switch ( k ) {
      case 'w':
      case 'W':
        w = false;
        break;
        
      case 'a':
      case 'A':
        a = false;
        break;
        
      case 's':
      case 'S':
        s = false;
        break;
        
      case 'd':
      case 'D':
        d = false;
        break;
    }
  }
}