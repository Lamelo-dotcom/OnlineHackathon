/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.Announcement;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Shezi
 */
@Local
public interface AnnouncementFacadeLocal {

    void create(Announcement announcement);

    void edit(Announcement announcement);

    void remove(Announcement announcement);

    Announcement find(Object id);

    List<Announcement> findAll();

    List<Announcement> findRange(int[] range);

    int count();
    
}
