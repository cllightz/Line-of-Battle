class Unit {
  public PVector pos;
  private ArrayList<PVector> posHistory;
  private int historySize = 20;
  public float size;
  public color c;
  
  Unit( PVector POS, float SIZE, color C ) {
    pos = POS;
    posHistory = new ArrayList<PVector>();
    size = SIZE;
    c = C;
  }
  
  public void move( PVector newPos ) {
    posHistory.add( new PVector( pos.x, pos.y ) );
    pos = new PVector( newPos.x, newPos.y );
  }
  
  public void moveV( PVector v ) {
    posHistory.add( new PVector( pos.x, pos.y ) );
    pos = new PVector( pos.x + v.x, pos.y + v.y );
  }
  
  public boolean hasFollowPos() {
    /*
    color textColor = color( 255, 255, 255 );
    fill( textColor );
    
    int textSize = 10;
    textSize( textSize );
    
    textAlign( CENTER );
    
    pushMatrix();
      translate( width/2, height/2 - 50 );
      scale( 5 );
      String text = posHistory.size() >= historySize ? "T" : "_";
      text( text, 0, 0 );
    popMatrix();
    */
      
    return posHistory.size() >= historySize;
  }
  
  public PVector getFollowPos() {
    PVector res = posHistory.get( 0 );
    posHistory.remove( 0 );
    return res;
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