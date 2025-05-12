package ac.za.tut.sb;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class HackathonEventFacade extends AbstractFacade<HackathonEvent> implements HackathonEventFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HackathonEventFacade() {
        super(HackathonEvent.class);
    }

    @Override
    public void joinHackathon(Long hackathonId, Long userId) {
        HackathonEvent hackathon = em.find(HackathonEvent.class, hackathonId);
        User user = em.find(User.class, userId);
        if (hackathon != null && user != null) {
            hackathon.getUsers().add(user);
            user.getHackathons().add(hackathon);
            em.merge(hackathon);
            em.merge(user);
        }
        
    }
    
}
