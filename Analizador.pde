public class Analizador {
    Web_C buscar;
    
    public Analizador () {
        this.buscar = new Web_C ();
    }
    public ArrayList<String> leerHTML (String text) {
      ArrayList <String> etiquetas = new ArrayList <String>();
      
      for (int i = 0; i < text.length() - 2; i ++) {
        String etiqueta = "";
         
        if (text.substring(i, i+1).equals("<")) {
          etiqueta = obtenerEtiqueta (text, i);
          if (!etiqueta.equals(""))
            etiquetas.add(etiqueta);
        }
      }
      
      return etiquetas;
    }
    
    public String obtenerHTML (String url) {
      return buscar.obtener_html(url);
    }
    
    public String obtenerEtiqueta (String text, int pos) {
      int j = pos;
      
      while (j < text.length()) {
        if (text.substring (j, j + 1).equals(" ")
         || text.substring (j, j + 1).equals(">"))
          return text.substring (pos + 1, j);
        
        j++;
      }
      
      return "";
    }
}
