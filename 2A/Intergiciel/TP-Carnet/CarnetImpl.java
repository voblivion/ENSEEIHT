import java.util.HashMap;
import java.net.MalformedURLException;
import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;
import java.util.HashMap;
import java.util.Map;

public class CarnetImpl extends UnicastRemoteObject implements Carnet {
	
	protected int id;
	protected HashMap<String, RFiche> fiches;
	public static int[] ports = new int[] {8081, 8082};
	
	protected CarnetImpl(int id) throws RemoteException {
		super();
		this.id = id;
		this.fiches = new HashMap<String, RFiche>();
	}
	
	public void Ajouter(SFiche sf) throws RemoteException {
		System.out.println("Ajouter " + sf.getNom());
		RFiche fiche = new RFicheImpl(sf.getNom(), sf.getEmail());
		fiches.put(sf.getNom(), fiche);
	}
	
	public RFiche Consulter(String n) throws RemoteException {
		System.out.println("Consulter " + n);
		return fiches.get(n);
	}
	
	public static void main(String[] args) {
		try {
			int id = Integer.parseInt(args[0]);
			Registry registry = LocateRegistry.createRegistry(2000);
			CarnetImpl serveur = new CarnetImpl(id);
			
			// String URL = "//localhost:" + ports[id] + "/serveur" + id;
			String URL = "//localhost:2000/Carnet" + id;
			
			Naming.rebind(URL, serveur);
		}
		catch(RemoteException err) {}
		catch(MalformedURLException e) {}
	}
}
