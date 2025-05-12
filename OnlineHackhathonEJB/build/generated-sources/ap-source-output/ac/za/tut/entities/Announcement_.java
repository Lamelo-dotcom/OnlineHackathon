package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Announcement.class)
public class Announcement_ { 

    public static volatile SingularAttribute<Announcement, Date> postedAt;
    public static volatile SingularAttribute<Announcement, HackathonEvent> hackathon;
    public static volatile SingularAttribute<Announcement, Long> id;
    public static volatile SingularAttribute<Announcement, String> title;
    public static volatile SingularAttribute<Announcement, String> content;

}