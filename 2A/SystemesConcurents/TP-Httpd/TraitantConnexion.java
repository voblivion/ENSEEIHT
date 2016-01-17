import java.net.Socket;

/** Gestion d'une requête.
 * 
 *  PQ (12-08), PM (10-14)
 */
public class TraitantConnexion extends Thread  {

    /** Les flux d'entrée et de sortie. */
    private LienCommunication lc;

    /** Constructeur : initialisation du lien de communication */
    public TraitantConnexion (Socket sc) {
        try {
        	this.lc = new LienCommunication(sc);
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
    }

    /** Traitement de la connexion. */
    public void run() {
        try {
        	gererRequete(lc);
        } finally {
            System.out.println("Fermeture de la connexion");
            lc.close();
        }
    }
    
/****************** Code ci-dessous fourni : ne pas modifier **************************/
/** Gestion (minimaliste) d'une requête : 
 * 		la requête est lue, décodée, et une réponse (page html) est générée et envoyée.
 *  Si la requête est un nombre N, on envoie successivement, pour k variant de 0 à N,
 * la série des entiers de 0 à k, au rythme d'une série par seconde.
 *  Sinon, on affiche simplement le texte de la requête.
 *
 */

    public void gererRequete(LienCommunication lc) {
        System.out.println("Début gestion requête");
        String requete, texte;
        try {
            requete = StupidHttpParser.getPath(lc.in);
        } catch (ParseError oops) {
            lc.out.println("HTTP/1.0 400 Bad Request");
            lc.out.println();
            System.out.println("Erreur analyse requête: "+oops.getMessage());
            lc.out.println("Badly formed request: "+oops.getMessage());
            return;
        }
        System.out.println("Requête pour "+requete);
        lc.out.println("HTTP/1.1 200 Ok");
        lc.out.println("MIME-Version: 1.0");
        lc.out.println("Content-Type: multipart/mixed;boundary=Separateur");
        //lc.out.println("Content-Disposition: inline");
        //lc.out.println("Content-Type: multipart/x-mixed-replace;boundary=Separator");
        lc.out.println();
        lc.out.println("--Separateur");
        lc.out.println("Content-type: text/plain; charset=utf-8");
        lc.out.println();
        lc.out.println("Vous avez demandé "+requete+".");
        lc.out.println();
        lc.out.flush();
        texte = "";
        try {
            int n = Integer.parseInt(requete.substring(1)); // ignorer le '/' de tête
            
            for (int i = 0; i <= n; i++) {
                texte=texte+i+"\n";
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    // ignore
                }
                lc.out.println("--Separateur");
                lc.out.println("Content-Type: text/plain; charset=utf-8");
                lc.out.println();
                lc.out.println(texte);
                lc.out.flush();
            }
            lc.out.println("Fini.");
        } catch (NumberFormatException e) {
            lc.out.println("C'est tout.");
        }
        lc.out.println("--Separateur");
        lc.out.flush();
        System.out.println("Fin gestion requête");
    }
}
