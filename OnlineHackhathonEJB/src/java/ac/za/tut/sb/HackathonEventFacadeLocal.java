package ac.za.tut.sb;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import java.util.List;
import javax.ejb.Local;

@Local
public interface HackathonEventFacadeLocal {

    void create(HackathonEvent hackathonEvent);

    void edit(HackathonEvent hackathonEvent);

    void remove(HackathonEvent hackathonEvent);
    
    void joinHackathon(Long hackathonId,Long userId);

    HackathonEvent find(Object id);

    List<HackathonEvent> findAll();

    List<HackathonEvent> findRange(int[] range);

    int count();
    
}
