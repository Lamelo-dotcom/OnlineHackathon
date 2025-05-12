/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.ProfilePicture;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Shezi
 */
@Local
public interface ProfilePictureFacadeLocal {

    void create(ProfilePicture profilePicture);

    void edit(ProfilePicture profilePicture);

    void remove(ProfilePicture profilePicture);

    ProfilePicture find(Object id);

    List<ProfilePicture> findAll();

    List<ProfilePicture> findRange(int[] range);

    int count();
    
}
