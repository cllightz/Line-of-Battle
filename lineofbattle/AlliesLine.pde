class AlliesLine {
  public ArrayList<Unit> units;
  
  AlliesLine() {
    units = new ArrayList<Unit>();
  }
  
  public void addUnit( Unit u ) {
    units.add( u );
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