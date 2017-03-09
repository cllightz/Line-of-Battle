class Shell {
  public PVector pos;
  public PVector v;
  public float size;
  public color c;
  
  Shell( PVector POS, PVector V, float SIZE, color C ) {
    pos = POS;
    v = V;
    size = SIZE;
    c = C;
  }
  
  public void move() {
    pos.add( v );
  }
  
  public void draw() {
    fill( c );
    noStroke();
    
    pushMatrix();
      translate( pos.x, pos.y );
      scale( size );
      ellipse( 0, 0, 1, 1 );
    popMatrix();
  }
}