void setup()
{
  size(2000, 1500, P2D);

  scl = 10;

  w = 1500 / scl;
  h = 1500 / scl;

  matrix = new int[w * h];
  for (int y = 0; y < h; y++)
  {
    for (int x = 0; x < w; x++)
    {
      matrix[x + y * w] = 0;
    }
  }

  buttons = new Button[2];
  buttons[0] = new Button(((w - 2) * scl) +  50, scl + 200, WIRE_IDLE, "WIRE", scl);
  buttons[1] = new Button(((w - 2) * scl) + 250, scl + 200, WIRE_SPRK, "SPRK", scl);

  textSize(42);
}


// CELL STATES
static final int CELL_IDLE = 0;

static final int WIRE_IDLE = 1;
static final int WIRE_SPRK = 2;
static final int WIRE_CDWN = 3;

int[] matrix;
Button[] buttons;

int w, h, scl;
int type; // 1 = wire; 2 = voltage

boolean pause, mouse_draw;

void draw()
{
  background(0);
  
  if (mouse_draw && ((mouseX >= scl && mouseX < (w - 2) * scl) && (mouseY >= scl && mouseY < (h - 2) * scl))) 
  {
    drawCell();
  }

  tick();
}

void show()
{
  for (int y = 1; y < h-1; y++)
  {
    for (int x = 1; x < w-1; x++)
    {
      int cell = matrix[x + y * w];

      if (cell == WIRE_IDLE) // IF CELL IS WIRE       -> DRAW WIRE
      {
        fill(127);
      }

      if (cell == WIRE_SPRK) // IF CELL IS ACTIVATED  -> DRAW ACTIVATED WIRE
      {
        fill(255, 255, 0);
      }

      if (cell == WIRE_CDWN) // IF CELL WAS ACTIVATED -> DRAW COOL-DOWN CELL
      {
        fill(0, 127, 127);
      }

      if (cell == CELL_IDLE) // IF CELL IS EMPTY      -> DRAW EMPTY CELL
      {
        fill(0);
      }

      noStroke();
      rect(x * scl, y * scl, scl, scl);
    }
  }

  for (int button = 0; button < buttons.length; button++)
  {
    Button butt = buttons[button];

    fill(255);
    text(butt.name, butt.x + scl * 3, butt.y + scl * 5);

    noFill();
    stroke(255, 0, 0);
    rect(butt.x, butt.y, 150, 75);
  }

  rect(scl, scl, (w - 2) * scl, (h - 2) * scl);
}

void tick()
{
  show();
}

void grid_clear()
{
}