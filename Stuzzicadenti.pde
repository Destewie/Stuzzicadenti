int len = 15; //<>// //<>//
ArrayList<Stick> Disegno;
int nStep = 128;

void setup ()
{
  size(1000, 1000);
  background (255, 204, 204);
  frameRate(20);
  
  Disegno = new ArrayList<Stick>();
  Stick s = new Stick(0, 0, -1);
  Disegno.add(s);
}

void draw()
{
  if (nStep > 0)
  { 
    translate(width/2, height/2);

    for (int i = Disegno.size(); i > 0; i--)
    {
      if (Disegno.get(i-1).dopoNuovo)
      {
        stroke(0);
        Disegno.get(i-1).Show();
        Disegno.get(i-1).dopoNuovo = false;
      }

      if (Disegno.get(i-1).nuovo)
      {
        stroke(0, 204, 204);
        Disegno.get(i-1).Show();
        Disegno.get(i-1).CreaVicini();
      }
    }
    
    nStep--;
  }
}
