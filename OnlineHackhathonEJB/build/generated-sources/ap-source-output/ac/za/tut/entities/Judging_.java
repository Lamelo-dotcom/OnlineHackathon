package ac.za.tut.entities;

import ac.za.tut.entities.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Judging.class)
public class Judging_ { 

    public static volatile SingularAttribute<Judging, Date> assignedAt;
    public static volatile SingularAttribute<Judging, Long> id;
    public static volatile SingularAttribute<Judging, User> user;

}