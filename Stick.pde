class Stick
{
  int x1, y1, x2, y2;
  int orient; //1 se verticale; -1 se orizzontale
  boolean nuovo = true;
  boolean dopoNuovo = false;
  //int ttc = 4; //ogni volta che vengono controllate le sue estremità, cala di uno. Quando diventa 0, possiamo anche non controllarlo proprio

  //------------------------------------------------------------------------------------------------------------

  public Stick(int a1, int b1, int o) //gli passo il punto centrale e l'orientamento che deve avere e lui si ricava le estremità
  {
    orient = o;
    
    if (o == 1) //verticale
    {
      x1 = a1;
      y1 = b1 - len/2;
      x2 = a1;
      y2 = b1 + len/2;
    } else //orizzontale
    {
      x1 = a1 - len/2;
      y1 = b1;
      x2 = a1 + len/2;
      y2 = b1;
    }
  }

  //------------------------------------------------------------------------------------------------------------

  public void Show()
  {
    line(x1, y1, x2, y2);
  }

  //------------------------------------------------------------------------------------------------------------

  public void CreaVicini()
  {
    if (ControlloContatto(x1, y1, 1))
    {
      Stick s = new Stick(x1, y1, orient*(-1));
      Disegno.add(s);
    }

    if (ControlloContatto(x2, y2, 2))
    {
      Stick s = new Stick(x2, y2, orient*(-1));
      Disegno.add(s);
    }
    
    nuovo = false;
    dopoNuovo = true;
  }

  //------------------------------------------------------------------------------------------------------------

  public boolean ControlloContatto(int a, int b, int numEstremita) //per esempio: controlla che l'estremità numero 1 alle coordinate x, y non sia toccata da un'estremità 2 di un'altro bastoncino orientato allo stesso modo
  {
    for (Stick s : Disegno)
    {
      if (s != this && s.orient == this.orient)
      {
        if (numEstremita == 1 && s.x2 == a && s.y2 == b)
        {
          return false;
          
        } else if (numEstremita == 2 && s.x1 == a && s.y1 == b)
        {
          return false;
        }
      }
    }

    return true;
  }

  //------------------------------------------------------------------------------------------------------------
}
