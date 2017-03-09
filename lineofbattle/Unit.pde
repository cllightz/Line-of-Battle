class Unit {
  public PVector pos;
  public float size;
  public color c;
  
  Unit( PVector POS, float SIZE, color C ) {
    pos = POS;
    size = SIZE;
    c = C;
  }
  
  void draw() {
    fill( c );
    noStroke();
    
    pushMatrix();
      translate( pos.x, pos.y );
      scale( size );
      ellipse( 0, 0, 1, 1 );
    popMatrix();
  }
}