
particle[] particles;
int counter = 0;
double rotation = 0;
double rotateby = Math.PI/100;
void setup()
{
  size(600, 600);
  background(0);
  rectMode(CENTER);
  noStroke();
  particles = new particle[200];
  for (int i = 0; i < particles.length; i++)
  {
    particles[i] = new normal();
  }
  particles[0] = new oddball();
  particles[1] = new jumbo();
}
void draw()
{
  translate(width/2,height/2);
  rotate((float)rotation);
  translate(-width/2,-height/2);
  fill(0, 20);
  rect(300, 300, 610, 610);
  for (int i = 0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].colorchange();
    particles[i].show();
  }
  if((counter-150)%300==0)
  {
    for (int i = 0; i < particles.length; i++)
    {
      particles[i].directionchange();
    }
  }
  if (counter%300==0)
  {
    rotateby*=-1;
  }
  counter++;
  rotation+=rotateby;
}

void mousePressed()
{
  for (int i = 0; i < particles.length; i++)
  {
    particles[i] = new normal();
  }
  particles[0] = new oddball();
  particles[1] = new jumbo();
  counter = 0;
}
void keyPressed()
{

}

interface particle
{
  public void move();
  public void colorchange();
  public void show();
  public void directionchange();
}

class normal implements particle
{
  double x, y, angle, speed;
  int r, g, b, size;
  String change;
  normal()
  {
    x = 300;
    y = 300;
    angle = (Math.random()*Math.PI*2);
    speed = (Math.random()*3);
    r = 0;
    g = 0;
    b = 255;
    size = 10;
    change = "br";
  }
  public void directionchange()
  {
    speed*=-1;
  }
  public void move()
  {
    x += Math.cos(angle)*speed;
    y += Math.sin(angle)*speed;
  }

  public void show()
  {
    fill(r, g, b);
    ellipse((float)x, (float)y, size, size);
  }
}

class oddball implements particle
{
  double x, y, angle, speed;
  int r, g, b, size;
  oddball()
  {
    x = 300;
    y = 300;
    angle = (Math.random()*Math.PI*2);
    speed = (Math.random()*3);
    r = 0;
    g = 0;
    b = 255;
    size = 10;
  }
  public void directionchange()
  {
    speed*=-1;
  }
  public void move()
  {
    x += Math.cos(angle)*speed + Math.random()*4-2;
    y += Math.sin(angle)*speed + Math.random()*4-2;
  }
  public void colorchange()
  {
  }
  public void show()
  {
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
    fill(r, g, b);
    ellipse((float)x, (float)y, size, size);
  }
}

class jumbo extends normal
{
  public void show()
  {
    fill(r, g, b);
    ellipse((float)x, (float)y, size*3, size*3);
  }
}
