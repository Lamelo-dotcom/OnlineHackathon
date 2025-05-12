package ac.za.tut.entities;

import ac.za.tut.entities.HackathonEvent;
import ac.za.tut.entities.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-05-08T06:52:37")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Double> ammout;
    public static volatile SingularAttribute<Payment, Long> id;
    public static volatile SingularAttribute<Payment, Date> transactionDate;
    public static volatile ListAttribute<Payment, HackathonEvent> hackathons;
    public static volatile SingularAttribute<Payment, User> user;
    public static volatile SingularAttribute<Payment, String> status;

}