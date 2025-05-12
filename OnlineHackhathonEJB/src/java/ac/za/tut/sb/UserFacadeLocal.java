package ac.za.tut.sb;

import ac.za.tut.entities.User;
import java.util.List;
import javax.ejb.Local;

@Local
public interface UserFacadeLocal {

    void create(User user);

    void edit(User user);

    void remove(User user);

    User find(Object id);

    User findUserByEmail(String email);
    
    List<User> findAll();
    
    List<User> findAllByRole(String role);

    List<User> findRange(int[] range);

    int count();
    int countByRole(String role);
    
}
