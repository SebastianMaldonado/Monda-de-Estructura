public class Analizador {
    Web_C buscar;
    
    public Analizador () {
        this.buscar = new Web_C ();
    }
    public ArrayList<String> leerHTML (String text) {
      ArrayList <String> tags = new ArrayList <String>();
      
      for (int i = 0; i < text.length() - 2; i ++) {
        String tag = "";
         
        if (text.substring(i, i+1).equals("<")) {
          tag = obtenerEtiqueta (text, i);
          if (!tag.equals(""))
            tags.add(tag);
        }
      }
      
      return tags;
    }
    
    public String obtenerHTML (String url) {
      return buscar.obtener_html(url);
    }
    
    public String obtenerEtiqueta (String text, int colocacion) {
      int j = colocacion;
      
      while (j < text.length()) {
        if (text.substring (j, j + 1).equals(" ")
         || text.substring (j, j + 1).equals(">"))
          return text.substring (colocacion + 1, j);
        
        j++;
      }
      
      return "";
    }
}
