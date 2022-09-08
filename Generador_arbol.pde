public class Pintor {
  ArrayList <String> tags;
  
  public Pintor () {
    this.tags = null;
  }
  
  
  public void Nom_List (ArrayList <String> tags) {
    this.tags = tags;
  }
  
  //-------------------------|Generar Árbol|-------------------------//
  public void mostrararbol (Nodo raiz, int colocacion) {
    if (colocacion > tags.size() && colocacion <= 0)  //Fin de la Lista
      return;
      
    if (tags.get(colocacion).substring(0, 1).equals("/"))  //Fin del Nodo
      return;
    
    if (validaciones(colocacion))  // Validaciones
      return;

    for (int i = colocacion + 1; i < texto_f(tags.get(colocacion), colocacion); i++) {
      //println("-> Estando en: " + colocacion);
      //println("Generado hijo de " + raiz.nombre +" : \n\t" + i + "  " + tags.get(i));
      
      //Crear el Nuevo Hijo
      Nodo nuevo = new Nodo (tags.get(i), i);
      raiz.añadirHijo(nuevo);
      mostrararbol (nuevo, i);
      
      int ubicacion_aux = texto_f (tags.get(i), i);
      if (ubicacion_aux > 0)
        i = ubicacion_aux;
      //println(tags.get(i) + "  " + i );
    }
  }
  
  public boolean validaciones (int colocacion) {
    if (tags.get(colocacion).equals("meta") 
    || tags.get(colocacion).equals("script")
    || tags.get(colocacion).equals("title")
    || tags.get(colocacion).equals("link"))
      return true;
    else
      return false;
  }
  
  public int texto_f (String busqueda, int colocacion) {
     int ubicacion_aux = colocacion + 1;
     
     //Recorrer hasta encontrar el cierre
     while (ubicacion_aux < tags.size()) {
       if (tags.get(ubicacion_aux).equals("/" + tags.get(colocacion)))
         return ubicacion_aux;
       ubicacion_aux += 1;
     }
     
     return 0;
  }

}
