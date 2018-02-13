void mousePressed()
{
  for(int button = 0; button < buttons.length; button++)
  {
    Button butt = buttons[button];
    
    if((mouseX >= butt.x && mouseX < butt.x + 150) && (mouseY >= butt.y && mouseY < butt.y + 75))
    {
      type = butt.type;
    }
  }
  
  mouse_draw = true;
}

void mouseReleased()
{
  mouse_draw = false;
}

void keyReleased()
{
  switch(key)
  {
  case 'c':
    grid_clear();
    break;
  case 'p':
    pause = !pause;
    break;
  }
}

boolean canPlace(int x, int y, int cellState)
{
  return (matrix[(x / scl) + (y / scl) * w] == cellState);
}

void drawCell()
{
  switch(type)
  {
  case 1:
    if (canPlace(mouseX, mouseY, CELL_IDLE))
    {
      matrix[(mouseX / scl) + (mouseY / scl) * w] = WIRE_IDLE;
    }
    break;
  case 2:
    if (canPlace(mouseX, mouseY, WIRE_IDLE))
    {
      matrix[(mouseX / scl) + (mouseY / scl) * w] = WIRE_SPRK;
    }
    break;
  }
}