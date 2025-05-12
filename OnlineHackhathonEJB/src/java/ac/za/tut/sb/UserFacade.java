package ac.za.tut.sb;

import ac.za.tut.entities.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }

    @Override
    public User findUserByEmail(String email) {
       
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email=:email",User.class);
        query.setParameter("email", email);
        
        try {
           return query.getSingleResult();
        } catch (Exception e) {
           return null;
        }
    }

    @Override
    public List<User> findAllByRole(String role) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.role=:role",User.class);
        query.setParameter("role", role);
        
        try {
           return query.getResultList();
        } catch (Exception e) {
           return null;
        }
    }

    @Override
    public int countByRole(String role) {
        TypedQuery<Integer> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.role = :role", Integer.class);
        query.setParameter("role", role);

    try {
        return query.getSingleResult();
    } catch (Exception e) {
         // Log the exception for debugging
        return 0; // Return 0 instead of throwing an exception
    }
    }        
}
    

