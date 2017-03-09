class Title {
  public void drawTitle() {
    color textColor = color( 255, 255, 255 );
    fill( textColor );
    
    int textSize = 10;
    textSize( textSize );
    
    textAlign( CENTER );
    
    pushMatrix();
      translate( width/2, height/2 - 50 );
      scale( 5 );
      String title = new String( "Line of Battle" );
      text( title, 0, 0 );
    popMatrix();
    
    pushMatrix();
      translate( width/2, height/2 + 25 );
      scale( 2 );
      String message = new String( "Press Left Mouse Button to Start" );
      text( message, 0, 0 );
    popMatrix();
    
    if ( mousePressed ) {
      scheneState = ScheneState.BATTLE;
    }
  }
}