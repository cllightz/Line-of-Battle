import java.util.ArrayDeque;

class AlliesLine {
  public ArrayList<Unit> units;
  private ArrayDeque<Unit> queue;
  
  AlliesLine() {
    units = new ArrayList<Unit>();
    queue = new ArrayDeque<Unit>();
  }
  
  public void addUnit( Unit u ) {
    queue.offer( u );
  }
  
  public void move( KeyManager keyManager ) {
    if ( ! units.isEmpty() && keyManager.isAnyPushed() ) {
      units.get( 0 ).moveV( keyManager.getVector().mult( 2.0 ) );
      
      for ( int i = 1; i < units.size(); i++ ) {
        if ( units.get( i - 1 ).hasFollowPos() ) {
          units.get( i ).move( units.get( i - 1 ).getFollowPos() );
        }
      }
    }
      
    if ( (units.isEmpty() || units.get( units.size() - 1 ).hasFollowPos()) && !queue.isEmpty() ) {
      units.add( queue.peek() );
      queue.poll();
    }
  }
  
  public void draw() {
    for ( Unit u : units ) {
      u.draw();
    }
  }
  
  public ArrayList<Unit> getUnits() {
    return units;
  }
}