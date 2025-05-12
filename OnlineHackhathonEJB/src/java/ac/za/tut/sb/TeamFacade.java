package ac.za.tut.sb;

import ac.za.tut.entities.Team;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


@Stateless
public class TeamFacade extends AbstractFacade<Team> implements TeamFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TeamFacade() {
        super(Team.class);
    }

    @Override
    public void removeHackthonTeams(Long hackathonId) {
       
        Query query = em.createQuery("DELETE FROM Team t WHERE t.hackathon.id = :hackathonId");
        query.setParameter("hackathonId", hackathonId);
        
        try {
            query.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
