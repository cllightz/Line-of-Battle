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