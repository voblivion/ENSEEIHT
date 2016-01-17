package simplepdl.utils;

import java.util.*;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import petrinet.*;
import simplepdl.*;
import simplepdl.Process;

public class SimplePDLToPetriNet {
    
    static Network nw;
    static PetrinetFactory pnFactory;
    
    static Map<String, Place> finisheds = new HashMap<String, Place>();
    static Map<String, Place> starteds = new HashMap<String, Place>();
    static Map<String, Transition> starts = new HashMap<String, Transition>();
    static Map<String, Transition> finishs = new HashMap<String, Transition>();
    
    public static void convertWorkDef(WorkDefinition wd) {
        
        /* Création des places associées à la WorkDefinition */

        // La première pour le cas non commencé
        Place p_ready = pnFactory.createPlace();
        p_ready.setName(wd.getName() + "_ready");
        p_ready.setTokensCount(1);
        nw.getElements().add(p_ready);
        
        // La deuxième pour savoir si commencé
        Place p_started = pnFactory.createPlace();
        p_started.setName(wd.getName() + "_started");
        p_started.setTokensCount(0);
        nw.getElements().add(p_started);
        
        // La troisième pour le cas en cours
        Place p_running = pnFactory.createPlace();
        p_running.setName(wd.getName() + "_running");
        p_running.setTokensCount(0);
        nw.getElements().add(p_running);
        
        // La dernière pour le cas terminé
        Place p_finished = pnFactory.createPlace();
        p_finished.setName(wd.getName() + "_ready");
        p_finished.setTokensCount(0);
        nw.getElements().add(p_finished);
        
        /* Création des transitions associées à la WorkDefinition */

        // La première pour commencer la WorkDefinition
        Transition t_start = pnFactory.createTransition();
        t_start.setName(wd.getName() + "_start");
        nw.getElements().add(t_start);
        
        // La deuxième pour finir la WorkDefinition
        Transition t_finish = pnFactory.createTransition();
        t_finish.setName(wd.getName() + "_finish");
        nw.getElements().add(t_finish);
        
        /* Création des arcs entre Places et Transitions associées à la WorkDefinition */
        
        Arc a_ready_start = pnFactory.createArc();
        a_ready_start.setSource(p_ready);
        a_ready_start.setTarget(t_start);
        nw.getArcs().add(a_ready_start);
        
        Arc a_start_started = pnFactory.createArc();
        a_start_started.setSource(t_start);
        a_start_started.setTarget(p_started);
        nw.getArcs().add(a_start_started);
        

        Arc a_start_running = pnFactory.createArc();
        a_start_running.setSource(t_start);
        a_start_running.setTarget(p_running);
        nw.getArcs().add(a_start_running);
        
        Arc a_running_finish = pnFactory.createArc();
        a_running_finish.setSource(p_running);
        a_running_finish.setTarget(t_finish);
        nw.getArcs().add(a_running_finish);
        
        Arc a_finish_finished = pnFactory.createArc();
        a_finish_finished.setSource(t_finish);
        a_finish_finished.setTarget(p_finished);
        nw.getArcs().add(a_finish_finished);
        
        // Mettre à jour les maps
        starteds.put(wd.getName(), p_started);
        finisheds.put(wd.getName(), p_finished);
        starts.put(wd.getName(), t_start);
        finishs.put(wd.getName(), t_finish);
    }
    
    public static void convertWorkSeq(WorkSequence ws) {
        Arc a = pnFactory.createArc();
        a.setReadOnly(true);
        
        if (ws.getLinkType() == WorkSequenceType.START_TO_START) {
            a.setSource(started.get(ws.getPredecessor().getName()));
            a.setTarget(start.get(ws.getSuccessor().getName()));
        }
        else if(ws.getLinkType() == WorkSequenceType.START_TO_FINISH) {
            a.setSource(started.get(ws.getPredecessor().getName()));
            a.setTarget(finish.get(ws.getSuccessor().getName()));
        }
        else if(ws.getLinkType() == WorkSequenceType.FINISH_TO_START) {
            a.setSource(finished.get(ws.getPredecessor().getName()));
            a.setTarget(start.get(ws.getSuccessor().getName()));
        }
        else {
            a.setSource(finished.get(ws.getPredecessor().getName()));
            a.setTarget(finish.get(ws.getSuccessor().getName()));
        }
        
        nw.getArcs().add(a);
    }

    public static void main(String[] args) {
        /* Chargement des packages */
        SimplepdlPackage spdlPkgInst = SimplepdlPackage.eINSTANCE;
        PetrinetPackage pnPkgInst = PetrinetPackage.eINSTANCE;
        
        /* Chargement des ressources */
        Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
        Map<String, Object> m = reg.getExtensionToFactoryMap();
        m.put("xmi", new XMIResourceFactoryImpl());
                
        // Créer un objet resourceSetImpl qui contiendra le modèle
        ResourceSet resSet = new ResourceSetImpl();

        // Charger le modèle en entrée
        URI modelURI = URI.createURI("models/SimplePDLCreator_Created_Process.xmi");
        Resource resource = resSet.getResource(modelURI, true);
        
        // Récupération du Process (racine du SimplePDL)
        Process proc = (Process)resource.getContents().get(0);
        
        // Créer le modèle en sortie
        URI pnURI = URI.createURI("models/SimplePDL_To_PetriNet.xmi");
        Resource pn = resSet.createResource(pnURI);
        
        // Créer 
        pnFactory = PetrinetFactory.eINSTANCE;
        nw = pnFactory.createPetriNet();
        nw.setName(proc.getName());
        pn.getContents().add(nw);
        
        System.out.println("Début de la conversion...");
        for (Object o : proc.getProcessElements()) {
            if (o instanceof WorkDefinition) {
                convertWorkDef((WorkDefinition)o);
            }
        }
        
        for (Object o : proc.getProcessElements()) {
            if (o instanceof WorkSequence) {
                convertWorkSeq((WorkSequence)o);
            }
        }
        
        try {
            pn.save(Collections.EMPTY_MAP);
        } catch(Exception e) {
            e.printStackTrace();
        }       
        System.out.println("Fin de la conversion !");
    }

}


