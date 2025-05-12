package ac.za.tut.sb;

import ac.za.tut.entities.Criteria;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Stateless
public class CriteriaFacade extends AbstractFacade<Criteria> implements CriteriaFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CriteriaFacade() {
        super(Criteria.class);
    }

    @Override
    public void removeHackathonCriteria(Long hackathonId) {

        Query query = em.createQuery("DELETE FROM Criteria c WHERE c.hackathon.id = :hackathonId");
        query.setParameter("hackathonId", hackathonId);

        try {
            query.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
