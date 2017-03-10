class MouseManager {
  boolean l;
  boolean c;
  boolean r;
  
  MouseManager() {
    l = false;
    c = false;
    r = false;
  }
  
  public void enable( int m ) {
    switch ( m ) {
      case LEFT:
        l = true;
        break;
        
      case CENTER:
        c = true;
        break;
        
      case RIGHT:
        r = true;
        break;
    }
  }
  
  public void disable( int m ) {
    switch ( m ) {
      case LEFT:
        l = false;
        break;
        
      case CENTER:
        c = false;
        break;
        
      case RIGHT:
        r = false;
        break;
    }
  }
  
  public boolean isAnyPressed() {
    return l || c || r;
  }
}