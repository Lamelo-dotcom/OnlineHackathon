package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.Submission;
import ac.za.tut.entities.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Team.class)
public class Team_ { 

    public static volatile ListAttribute<Team, Submission> submissions;
    public static volatile SingularAttribute<Team, String> name;
    public static volatile SingularAttribute<Team, HackathonEvent> hackathon;
    public static volatile SingularAttribute<Team, String> description;
    public static volatile SingularAttribute<Team, Long> id;
    public static volatile SingularAttribute<Team, User> user;
    public static volatile ListAttribute<Team, User> users;

}