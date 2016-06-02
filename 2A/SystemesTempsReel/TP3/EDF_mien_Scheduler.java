import storm.Schedulers.Scheduler; 
import storm.*; 
import storm.Processors.*; 
import storm.Tasks.*;
import java.util.ArrayList; 
import java.util.Collections; 
import java.util.Comparator;

public class RM_P_Scheduler extends Scheduler {
    class LReady extends ArrayList implements Comparator { 
        public int compare(Object arg0, Object arg1) {
            Task T0 = (Task) arg0; 
            Task T1 = (Task) arg1; 
            int d0 = T0.getOwnFieldIntValue("period"); 
            int d1 = T1.getOwnFieldIntValue("period"); 
            if (d1 > d0) return -1; else if (d1 == d0) return 0;
            else return 1;
        }
    } 

    private LReady[] lists_ready; 
    private boolean todo = false;

    public void init() {
        ArrayList CPUS = this.Kernel.getTasksListeManager().getProcessors(); 
        lists_ready = new LReady[CPUS.size()];

        for(int i = 0; i < CPUS.size(); i++) {
            lists_ready[i] = new LReady();
        }
    }

    public void onActivate(EvtContext c) { 
        Task T = (Task)c.getCible(); 
        int alloc = T.getOwnFieldIntValue("alloc");
        lists_ready[alloc-1].add(T); 
        todo = true;
    }

    public void onUnBlock(EvtContext c){ 
        Task T = (Task)c.getSource(); 
        int alloc = T.getOwnFieldIntValue("alloc");
        lists_ready[alloc-1].add(T); 
        todo = true;
    }

    public void onBlock(EvtContext c){ 
        Task T = (Task)c.getSource(); 
        int alloc = T.getOwnFieldIntValue("alloc");
        lists_ready[alloc-1].remove(T); 
        todo = true;
    }


    public void onTerminated(EvtContext c){ 
        Task T = (Task)c.getSource(); 
        int alloc = T.getOwnFieldIntValue("alloc");
        lists_ready[alloc-1].remove(T); 
        todo = true;
    }


    public void sched(){ 
        if (todo) {
            select(); 
            todo = false;

        }
    }


    public void select() { 
        ArrayList CPUS =this.Kernel.getTasksListeManager().getProcessors(); 
        int m = CPUS.size();

        for(int j = 0; j < m; j++) {
            Collections.sort(lists_ready[j],lists_ready[j]);
            for (int i=m; i<lists_ready[j].size(); i++){ 
                Task T = (Task) lists_ready[j].get(i); 
                if (T.isIsrunning()) T.preempt();
            }
            Task T = (Task) lists_ready[j].get(0); 
            if(!T.isIsrunning()) {
                Processor P = (Processor)CPUS.get(j);
                T.runningOn(P);
            }
        }
    }
}
