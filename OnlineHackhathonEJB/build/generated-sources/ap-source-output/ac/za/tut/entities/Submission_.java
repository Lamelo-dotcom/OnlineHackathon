package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.Team;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Submission.class)
public class Submission_ { 

    public static volatile SingularAttribute<Submission, Date> updationDate;
    public static volatile SingularAttribute<Submission, HackathonEvent> hackathon;
    public static volatile SingularAttribute<Submission, Date> submissionDate;
    public static volatile SingularAttribute<Submission, Long> id;
    public static volatile SingularAttribute<Submission, Team> team;
    public static volatile SingularAttribute<Submission, String> title;
    public static volatile SingularAttribute<Submission, String> status;

}