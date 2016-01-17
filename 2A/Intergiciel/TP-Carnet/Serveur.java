// From Gibs

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.Map;

import Fiche.RFiche;
import Fiche.RFicheImpl;
import Fiche.SFiche;

public class Serveur extends java.rmi.server.UnicastRemoteObject implements IServeur {

Map<String, RFicheImpl> fiches;
int id;

public static int[] ports = new int[] {8081, 8082, 8083};

protected Serveur(int id) throws RemoteException {
super();

this.id = id;
fiches = new HashMap<String, RFicheImpl>();
}

public static void main(String[] args) {
try {
int id = Integer.parseInt(args[0]);
Registry registry = LocateRegistry.createRegistry(ports[id]);
IServeur serveur = new Serveur(id);

String URL = "//localhost:" + ports[id] + "/serveur" + id;

System.out.println("connected on : " + URL);
Naming.rebind(URL, serveur);
} catch (RemoteException | MalformedURLException e) {
e.printStackTrace();
}
}

@Override
public void ajouter(SFiche fiche) throws RemoteException {
RFicheImpl rfiche = new RFicheImpl(fiche.getNom(), fiche.getEmail());
fiches.put(fiche.getNom(), rfiche);
}

@Override
public RFiche consulter(String n, boolean forward) throws RemoteException {
System.out.println("consultation : " + forward + " " + n);
RFiche f = fiches.get(n);
for(int i = 0; i < ports.length && f == null && forward; i++) {
if(i != id) {
System.out.println(i);
try {
f = ((IServeur)Naming.lookup("//localhost:" + ports[i] + "/serveur" + i)).consulter(n, false);
} catch (MalformedURLException e) {
e.printStackTrace();
} catch (NotBoundException e) {
e.printStackTrace();
}
}
}
return f;
}
}
