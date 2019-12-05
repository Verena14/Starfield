ArrayList <Particle> parts;
void setup()
{
  size(800,600);
  noStroke();
  reset();
}

void draw()
{
  background(0);
  for(int i = 0; i < parts.size(); i++)
  {
    parts.get(i).show();
    parts.get(i).move();
  }
}

class Particle
{
  protected double myX, myY, myAngle, mySpeed, myXr, myYr;
  protected int myR, myG, myB;
  
  
  public Particle()
  {
    myX = Math.random()*800;
    myY = Math.random()*600;
    myAngle = Math.random()*360;
    mySpeed = 10;
    myXr = 10;
    myYr = 10;
    myR = 100;
    myG = 200;
    myB = 180;
  }
  
  public void move()
  {
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed;
  }
  
  public void show()
  {
    fill(myR, myG, myB);
    ellipse((float)myX, (float)myY, (float)myXr, (float)myYr);
  }
  
  //optional opacity change
  public void show(int n)
  {
    fill(myR, myG, myB, n);
    ellipse((float)myX, (float)myY, (float)myXr, (float)myYr);
  }
  
  public void setSpeed(double n)
  {
    mySpeed = n;
  }
  public double getSpeed()
  {
    return mySpeed;
  }
  
  public void setXr(double n)
  {
    myXr = n;
  }
  public double getXr()
  {
    return myXr;
  }
  
  public void setYr(double n)
  {
    myYr = n;
  }
  public double getYr()
  {
    return myYr;
  }
  
  public void setR(int n)
  {
    myR = n;
  }
  public double getR()
  {
    return myR;
  }
  
  public void setG(int n)
  {
    myG = n;
  }
  public double getG()
  {
    return myG;
  }
  
  public void setB(int n)
  {
    myB = n;
  }
  public double getB()
  {
    return myB;
  }
  
  public double getX()
  {
    return myX;
  }
  public double getY()
  {
    return myY;
  }
  public double getAngle()
  {
    return myAngle;
  }
}

class Vert extends Particle
{
  protected double myLength;
  protected int myMin, myMax;
  protected boolean pos;
  public Vert(int a, int b, int c)
  {
    //a is stationary position
    //b is min range
    //c is range
    super();
    myR = 300;
    myX = a;
    myY = Math.random()*c + b;
    myMin = b;
    myMax = b + c;
    pos = (int)(Math.random()*2) == 0;
  }
  
  public void move()
  {
    if(myY >= myMax){
      pos = false;
    }
    if(myY <= myMin){
      pos = true;
    }
    
    if(pos)
    {
      myY += Math.random()*mySpeed;
    }else{
      myY -= Math.random()*mySpeed;
    }
  }
}

class Hori extends Vert
{
  public Hori(int a, int b, int c)
  {
    super(a,b,c);
  }
  
  public void show()
  {
    fill(myR, myG, myB);
    ellipse((float)myY, (float)myX, (float)myXr, (float)myYr);
  }
}

class Blocker extends Particle
{
  public Blocker()
  {
    super();
    myR = 0;
    myG = 0;
    myB = 0;
    myXr = Math.random()*30;
    myYr = Math.random()*30;
    mySpeed = 5;
  }
  public void move()
  {
    super.move();
    myXr = Math.random()*30;
    myYr = Math.random()*30;
  }
  public void show()
  {
    fill(255);
    ellipse((float)myX, (float)myY, (float)myXr+3, (float)myYr+3);
    super.show();
  }
}

class Cursor extends Particle
{
  public Cursor()
  {
    super();
    myR = 255;
    myG = 0;
    myB = 0;
    myX = mouseX;
    myY = mouseY;
    myXr = 20;
    myYr = 20;
  }
  
  public void move()
  {
    myX = mouseX;
    myY = mouseY;
    super.move();
  }
}

public void mousePressed()
{
  reset();
}

public void reset()
{
    parts = new ArrayList <Particle>();
  for(int i = 0; i < 50; i++)
  {
    //Letter H
    parts.add(new Vert(50,200,200));
    parts.add(new Hori(300,50,100));
    parts.add(new Vert(150,200,200));
    //Letter E
    parts.add(new Vert(200,200,200));
    parts.add(new Hori(200,200,100));
    parts.add(new Hori(300,200,100));
    parts.add(new Hori(400,200,100));
    //Letter L (1)
    parts.add(new Vert(350,200,200));
    parts.add(new Hori(400,350,100));
    //Letter L (2)
    parts.add(new Vert(500,200,200));
    parts.add(new Hori(400,500,100));
    //Letter O
    parts.add(new Vert(650,200,200));
    parts.add(new Hori(200,650,100));
    parts.add(new Hori(400,650,100));
    parts.add(new Vert(750,200,200));
    //top line
    parts.add(new Hori(100,0,800));
    //bottom line
    parts.add(new Hori(500,0,800));
  }
  
  for(int i = 0; i < 70; i++)
  {
    parts.add(new Blocker());
  }
  
  for(int i = 0; i < 1000; i++)
  {
    parts.add(new Particle());
  }
  
  parts.add(new Cursor());
}
