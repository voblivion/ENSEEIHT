/****************** Code fourni : ne pas modifier **************************/
import java.io.*;
import java.net.Socket;

/** Classe fournissant des flux d'entrée/sortie simplifiés 
 *  au dessus de la couche socket.
 * 
 * @author queinnec (modifs commentaires/identifiants PM, 10-14)
 *
 */
public class LienCommunication {

    /** Le flux d'entrée où lire la requête. */
    public BufferedReader in;

    /** Le flux de sortie où écrire la réponse. */
    public PrintWriter out;

    /** Socket associé au lien de communication. */
    private Socket sc;
    
    private boolean needClose;
    
    public LienCommunication (Socket sc) throws IOException {
        this.in = new BufferedReader (new InputStreamReader (sc.getInputStream()));
        this.out = new PrintWriter (sc.getOutputStream(),true);
        this.sc = sc;
        this.needClose = true;
    }
    
    public void close() {
        if (! needClose)
            return;
        try {
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.close();
        try {
            sc.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.needClose = false;
    }
    
    public void finalize() {
        this.close();
    }
    
}