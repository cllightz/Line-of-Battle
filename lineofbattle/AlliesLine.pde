class AlliesLine {
  public ArrayList<Unit> units;
  
  AlliesLine() {
    units = new ArrayList<Unit>();
  }
  
  public void addUnit( Unit u ) {
    units.add( u );
  }
  
  public void move( KeyManager keyManager ) {
    if ( keyPressed ) {
      if ( ! units.isEmpty() ) {
        units.get( 0 ).pos.add( keyManager.getVector().mult( 1 ) );
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