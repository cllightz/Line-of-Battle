class Shell {
  public float x;
  public float y;
  public float size;
  public color c;
  
  Shell( float X, float Y, float SIZE, color C ) {
    x = X;
    y = Y;
    size = SIZE;
    c = C;
  }
  
  void draw() {
    fill( c );
    noStroke();
    
    pushMatrix();
      translate( x, y );
      scale( size );
      ellipse( 0, 0, 1, 1 );
    popMatrix();
  }
}