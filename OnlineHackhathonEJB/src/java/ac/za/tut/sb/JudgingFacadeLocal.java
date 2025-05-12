/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.Judging;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Shezi
 */
@Local
public interface JudgingFacadeLocal {

    void create(Judging judging);

    void edit(Judging judging);

    void remove(Judging judging);

    Judging find(Object id);

    List<Judging> findAll();

    List<Judging> findRange(int[] range);

    int count();
    
}
