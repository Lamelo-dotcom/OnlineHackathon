/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.Discussion;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Shezi
 */
@Stateless
public class DiscussionFacade extends AbstractFacade<Discussion> implements DiscussionFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiscussionFacade() {
        super(Discussion.class);
    }
    
}
