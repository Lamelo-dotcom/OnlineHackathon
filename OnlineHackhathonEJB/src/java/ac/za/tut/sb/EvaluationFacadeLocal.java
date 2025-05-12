/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ac.za.tut.sb;

import ac.za.tut.entities.Evaluation;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Shezi
 */
@Local
public interface EvaluationFacadeLocal {

    void create(Evaluation evaluation);

    void edit(Evaluation evaluation);

    void remove(Evaluation evaluation);

    Evaluation find(Object id);

    List<Evaluation> findAll();

    List<Evaluation> findRange(int[] range);

    int count();
    
}
