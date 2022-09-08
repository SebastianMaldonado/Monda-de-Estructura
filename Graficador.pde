public class Graficador {
  int niv_tama;        
  int[] nodos;   
  int[] nodos_cont;   
  int nivel;        
  int s;            
  int nodo_tama;       
  
  public Graficador (Arbol arbol, int nodo_tama, int s) {
    this.s = s;
    this.nodo_tama = nodo_tama;
    
    this.nivel = arbol.obtenerAltura();
    this.nodos = new int[this.nivel];
    this.nodos_cont = new int[this.nivel];
    
    escanearArbol (arbol.obtenerRaiz(), 1);
  }
  
  
  public int obtenerTamNodo () {
    return nodo_tama;
  }
  
  public void escanearArbol (Nodo nodo, int nivel) {
    this.nodos = new int [this.nivel];
    nodos[0] = 1;
    this.alturaNiveles (0, nodo);
    
    int may = 0;
    for (int i = 0; i < this.nivel; i++) {
      if (may < nodos[i])
        may = nodos[i];
    }
    
    println(may);
    this.niv_tama = (50 * may) + (s * (may - 1));
    println(niv_tama + "   " + may * (s + nodo_tama));
    motor.ajustarMV(niv_tama, may * (s + nodo_tama));
  }
  
  public void alturaNiveles (int nivel, Nodo nodo) {
    if (nivel < this.nivel - 1)
      this.nodos[nivel + 1] += nodo.cantidadHijos();
      
    for (int i = 0; i < nodo.cantidadHijos(); i++) {
      alturaNiveles(nivel + 1, nodo.obtenerHijo (i));
    }
  }
  
  public void asignarPosArbol (Nodo nodo, int nivel) {
    int y = ((nodo_tama + s) * nivel);
    //println(niv_tama);
    //println(centrado + "  " + nivel + "  " + nodos[nivel]);
    int x = (nodo_tama + s) * (nodos_cont[nivel]);
    x = x + (niv_tama - ((nodo_tama * nodos[nivel]) + (s * (nodos[nivel] - 1)))) / 2;
    
    nodo.asignarPos (x, y);
    nodos_cont[nivel] += 1;
    
    for (int i = 0; i < nodo.cantidadHijos(); i++) {
      asignarPosArbol (nodo.obtenerHijo (i), nivel + 1);
    }
  }
}
