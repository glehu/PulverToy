class Button
{
  int x, y, type, scl;
  
  String name;
  
  Button(int x, int y, int type, String name, int scl)
  {
    this.x = x;
    this.y = y;
    this.type = type;
    this.name = name;
    this.scl = scl;
  }
  
  int button_press()
  {
    return type;
  }
}