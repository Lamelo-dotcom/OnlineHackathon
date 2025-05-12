package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.Judging;
import ac.za.tut.entities.Payment;
import ac.za.tut.entities.ProfilePicture;
import ac.za.tut.entities.Team;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> lastName;
    public static volatile SingularAttribute<User, String> role;
    public static volatile ListAttribute<User, Team> teams;
    public static volatile ListAttribute<User, ProfilePicture> profilePictures;
    public static volatile ListAttribute<User, Payment> payments;
    public static volatile ListAttribute<User, Judging> judgings;
    public static volatile SingularAttribute<User, String> bio;
    public static volatile SingularAttribute<User, Team> team;
    public static volatile SingularAttribute<User, Date> creationDate;
    public static volatile ListAttribute<User, HackathonEvent> hackathons;
    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Integer> phoneNumber;
    public static volatile SingularAttribute<User, String> dob;
    public static volatile SingularAttribute<User, Long> id;
    public static volatile SingularAttribute<User, String> email;

}