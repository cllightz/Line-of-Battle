class Shell {
  public float x;
  public float y;
  public float vx;
  public float vy;
  public float size;
  public color c;
  
  Shell( float X, float Y, float VX, float VY, float SIZE, color C ) {
    x = X;
    y = Y;
    vx = VX;
    vy = VY;
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
  
  void move() {
    x += vx;
    y += vy;
  }
}