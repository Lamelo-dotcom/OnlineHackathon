package ac.za.tut.sb;

import ac.za.tut.entities.Team;
import java.util.List;
import javax.ejb.Local;

@Local
public interface TeamFacadeLocal {

    void create(Team team);

    void edit(Team team);

    void remove(Team team);
    void removeHackthonTeams(Long hackathonId);

    Team find(Object id);

    List<Team> findAll();

    List<Team> findRange(int[] range);

    int count();
    
}
