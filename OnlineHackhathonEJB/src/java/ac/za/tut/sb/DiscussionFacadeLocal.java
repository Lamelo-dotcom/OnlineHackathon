/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.Discussion;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Shezi
 */
@Local
public interface DiscussionFacadeLocal {

    void create(Discussion discussion);

    void edit(Discussion discussion);

    void remove(Discussion discussion);

    Discussion find(Object id);

    List<Discussion> findAll();

    List<Discussion> findRange(int[] range);

    int count();
    
}
