/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.ProfilePicture;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Shezi
 */
@Stateless
public class ProfilePictureFacade extends AbstractFacade<ProfilePicture> implements ProfilePictureFacadeLocal {

    @PersistenceContext(unitName = "OnlineHackhathonEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProfilePictureFacade() {
        super(ProfilePicture.class);
    }
    
}
