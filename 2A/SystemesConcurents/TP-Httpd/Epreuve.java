/****************** Code fourni : ne pas modifier **************************/
import java.net.Socket;
import java.net.ServerSocket;
import java.io.*;

public class Epreuve {

	public static void main(String args[]) {
		int nbArgs=args.length;
		int nbReq=1000;
		int attente=100000; //(100s)
		int portServeur=5000;
	
	    if ((nbArgs != 0) && (nbArgs != 2)) {
            System.out.println("java epreuve  <nb requetes> <attente (s)>");
            System.exit (1);
        }

        if (nbArgs == 2) {
		  try {
		  	nbReq = Integer.parseInt(args[0]);
            if (nbReq < 0) {
                System.out.println( "nb req >= 0");
                System.exit (1);
            }

            attente = Integer.parseInt(args[1]);
            if (attente < 0) {
                System.out.println("attente >= 0");
                System.exit (1);
            } 
          } catch (NumberFormatException e) {
			System.out.println("java epreuve  <nb requetes> <attente (s)>");
            System.exit (1);       	
          }
		} else {
			System.out.println("valeurs par défaut : "+nbReq+" requêtes, "+attente+"s d'attente");
		}
		for (int i = 0; i <= nbReq; i++) {
		try {
			Socket s = new Socket("localhost", portServeur);
			PrintWriter out = new PrintWriter (s.getOutputStream(),true);
			out.println("GET TestEpreuveXYZ/"+(5000+i));
		} catch (Exception e) {
        	System.out.println("erreur en "+i+" : "+e);
    	}	
   		if ((i%100) == 0) System.out.println("n="+i+"\n");
  	}
  	try {
		Thread.sleep(attente); //attendre pour garder les connexions ouvertes
	}  catch (InterruptedException e) {
	            e.printStackTrace();
    }
   }
}