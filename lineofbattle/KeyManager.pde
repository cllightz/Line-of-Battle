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
  
  public void enable( char k ) {
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
  
  public void disable( char k ) {
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
  
  public PVector getVector() {
    float x = (a?-1:0) + (d?1:0);
    float y = (w?-1:0) + (s?1:0);
    return new PVector( x, y ).normalize();
  }
  
  public boolean isAnyPushed() {
    return w || a || s || d;
  }
}