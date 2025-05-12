package ac.za.tut.sb;

import ac.za.tut.entities.Criteria;
import java.util.List;
import javax.ejb.Local;

@Local
public interface CriteriaFacadeLocal {

    void create(Criteria criteria);

    void edit(Criteria criteria);

    void remove(Criteria criteria);
    
    void removeHackathonCriteria(Long hackathonId);

    Criteria find(Object id);

    List<Criteria> findAll();

    List<Criteria> findRange(int[] range);

    int count();
    
}
