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