package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Criteria.class)
public class Criteria_ { 

    public static volatile SingularAttribute<Criteria, String> name;
    public static volatile SingularAttribute<Criteria, HackathonEvent> hackathon;
    public static volatile SingularAttribute<Criteria, String> description;
    public static volatile SingularAttribute<Criteria, Integer> weight;
    public static volatile SingularAttribute<Criteria, Long> id;

}