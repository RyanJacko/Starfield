Particle[] bob;
int opac, z, s, speed, a, col;
void setup()
{

  opac = 255;
  size(500, 500);
  background(0);
  bob = new Particle[501];
  for (int i=0; i<= 489; i++)
  {
    bob[i] = new NormalParticle();
  }
  for (int i=490; i<= 499; i++)
  {
    bob[i] = new OddballParticle();
  }
  bob[500] = new JumboParticle();
}
void draw()
{
  fill(0, 0, 0, opac);
  rect(0, 0, 500, 500);
  noStroke();
    for (int i=490; i<= 499; i++)
  {
    bob[i].UpdateCol(this.col);
  }
  if (this.a == 1)
  {
    this.col =color(255, 0, 0);
    this.s = (int)(Math.random()*267546565)+299792458;
    fill(255, 0, 0);
    textAlign(LEFT, TOP);  
    text("m/s", 75, 10);
    text(this.s, 10, 10);
    this.opac = 20;
  } 
  else if (this.a == 0)
  {
    this.col =color(0, 255, 0);
    this.s = (int)(Math.random()*2675465)+257795458;
    fill(0, 255, 0);
    textAlign(LEFT, TOP);  
    text("m/s", 75, 10);
    text(this.s, 10, 10);
    this.opac = 255;
  }
  else
  {
    this.col =color(0, 255, 0);
    this.s = (int)(Math.random()*2675465)+257795458;
    fill(0, 255, 0);
    textAlign(LEFT, TOP); 
    text("m/s", 75, 10);
    text(this.s, 10, 10);
    this.opac = 255;
  }


    for (int i=0; i< bob.length; i++)
    {
      bob[i].move();
      bob[i].show();
    }
    Point();
    z = (int)(Math.random()*120)+130;
  }
  void mousePressed()
  {
    this.a = 1;
  }
  void mouseReleased()
  {
    this.a = 0;
  }


  class NormalParticle implements Particle
  {
    int col, s;
    double myX, myY, speed, ang;
    NormalParticle()
    {
      myX = 250;
      myY = 250;
      this.speed = Math.random()*5;
      ang = Math.random()*2*Math.PI;
      col =color(255);
      //color(0,mouseX/2,mouseY/2);
    }
    public void UpdateCol(int col)
    {
      
      this.col = col;
    }
    public void UpdateSpeed(int speed)
    {
      
      this.speed = speed;
    }
    
    public void move()
    {
      if (myX<0)
      {
        myX=250;
        myY=250;
      }
      if (myX>500)
      {
        myX=250;
        myY=250;
      }
      if (myY<0)
      {
        myX=250;
        myY=250;
      }
      if (myY>500)
      {
        myX=250;
        myY=250;
      }
      myX = myX + Math.cos(ang)*speed;
      myY = myY + Math.sin(ang)*speed;
    }
    public void show()
    {
      fill(col);
      stroke(255);
      strokeWeight(1);

      line((float)myX, (float)myY, 250, 250);
    }
  }

  interface Particle
  {
    public void show();
    public void move();
    public void UpdateCol(int col);
    //  public void mousePressed();
  }
  class OddballParticle implements Particle
  {
    int col, s;
    double myX, myY, speed, ang, bounceX, bounceY;
    boolean up, down, left, right;
    OddballParticle()
    {
      up = false;
      down = false;
      left = false;
      right = false;
      myX = 250;
      myY = 250;
      speed = Math.random()*5+2;
      ang = Math.random()*2*Math.PI;
      this.col = color(0,255,0);
      bounceX = Math.cos(ang)*speed;
      bounceY = Math.sin(ang)*speed;
    }
    public void UpdateCol(int col)
    {
      
      this.col = col;
    }
    public void UpdateSpeed(int speed)
    {
      
      this.speed = speed;
    }
    
    public void move()
    {

      if (myX<=0)
      {
        bounceX =  -bounceX;
      }
      if (myX>=500)
      {
        bounceX = -bounceX;
      }
      if (myY<=0)
      {
        bounceY = -bounceY;
      }
      if (myY>=500)
      {
        bounceY = -bounceY;
      }

      myX = myX + bounceX;
      myY = myY + bounceY;
    }
    public void show()
    {
      noStroke();
      fill(this.col);
      ellipse((float)myX, (float)myY, 5, 5);
    }
  }
  class JumboParticle extends OddballParticle
  {
    JumboParticle()
    {
      speed = Math.random()*5 + 10;
    }

    public void UpdateSpeed(int speed)
    {
      
      this.speed = speed;
    }
    public void show()
    {
      fill((int)(Math.random()*100)+155, (int)(Math.random()*100)+155, (int)(Math.random()*100)+155);
      rect((float)myX, (float)myY, 35, 35);
    }
  }
  void Point()
  {
    fill(z, z, z);
    ellipse(250, 250, 10, 10);
  }