package ac.za.tut.entities;

import ac.za.tut.entities.Announcement;
import ac.za.tut.entities.Criteria;
import ac.za.tut.entities.Payment;
import ac.za.tut.entities.Reward;
import ac.za.tut.entities.Submission;
import ac.za.tut.entities.Team;
import ac.za.tut.entities.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(HackathonEvent.class)
public class HackathonEvent_ { 

    public static volatile ListAttribute<HackathonEvent, Team> teams;
    public static volatile SingularAttribute<HackathonEvent, String> endDate;
    public static volatile ListAttribute<HackathonEvent, Payment> payments;
    public static volatile SingularAttribute<HackathonEvent, String> description;
    public static volatile ListAttribute<HackathonEvent, User> users;
    public static volatile ListAttribute<HackathonEvent, Submission> submissions;
    public static volatile ListAttribute<HackathonEvent, Criteria> criterias;
    public static volatile SingularAttribute<HackathonEvent, String> name;
    public static volatile SingularAttribute<HackathonEvent, String> location;
    public static volatile SingularAttribute<HackathonEvent, Long> id;
    public static volatile ListAttribute<HackathonEvent, Announcement> announcements;
    public static volatile SingularAttribute<HackathonEvent, String> startDate;
    public static volatile SingularAttribute<HackathonEvent, String> registrationDeadline;
    public static volatile ListAttribute<HackathonEvent, Reward> rewards;
    public static volatile SingularAttribute<HackathonEvent, String> status;

}