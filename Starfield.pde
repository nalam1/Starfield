
Particle stars[]=new Particle[1111];
int sizeX=800;
int sizeY=800;
void setup()
{
	size(sizeX,sizeY);
	for(int i=0;i<stars.length-2;i++)
	{
		stars[i]=new NormalParticle();
	}
	stars[stars.length-2]=new OddballParticle();
	stars[stars.length-1]=new JumboParticle();
}
void draw()
{
	for(int i=0;i<stars.length;i++)
	{
		stars[i].move();
		stars[i].show();
	}
}
class NormalParticle implements Particle
{
	float r,g,b;
	double x,y,speed,angle;
	int size;
	NormalParticle()
	{
		r=(int)(Math.random()*256);
		g=(int)(Math.random()*256);
		b=(int)(Math.random()*256);
		x=sizeX/2;
		y=sizeY/2;
		speed=Math.random()*5;
		angle=Math.random()*TWO_PI;
		size=10;
	}
	void move()
	{
		angle=angle+0.0075;
		x=x+(Math.cos(angle))*speed;
		y=y+(Math.sin(angle))*speed;
	}
	void show()
	{
		stroke(r,g,b);
		fill(r,g,b);
		ellipse((float)x,(float)y,size,size);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y,speed,angle;
	int size;
	OddballParticle()
	{
		x=sizeX/2;
		y=sizeY/2;
		speed=Math.random()*10;
		angle=Math.random()*TWO_PI;
		size=15;
	}
	void move()
	{
		angle=angle+0.0075;
		x=x-(Math.cos(angle))*speed;
		y=y-(Math.sin(angle))*speed;
		if(x<0||x>sizeX)
		{
			x=x+(Math.cos(angle))*speed;
		}
		if(y<0||y>sizeY)
		{
			y=y+(Math.sin(angle))*speed;
		}

	}
	void show()
	{
		stroke(255);
		fill(255);
		ellipse((float)x,(float)y,size,size);

	}
}
class JumboParticle extends NormalParticle
{	
	JumboParticle()
	{
		size=25;
	}
}
