package ac.za.tut.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;


@Entity
public class HackathonEvent implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private String location;
    
    private String startDate;
    
    private String endDate;
    
    private String registrationDeadline;
    
    private String status;
    
    @OneToMany(mappedBy = "hackathon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Team> teams;
    
    @OneToMany(mappedBy = "hackathon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Submission> submissions;
    
    @OneToMany(mappedBy = "hackathon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Announcement> announcements;
    
    @OneToMany(mappedBy = "hackathon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Criteria> criterias;
    
    @OneToMany(mappedBy = "hackathon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Reward> rewards;
    
    @ManyToMany(mappedBy = "hackathons",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Payment> payments;
    
     @ManyToMany(mappedBy = "hackathons")
     private List<User> users = new ArrayList<>();

    public HackathonEvent() {
    }

    public HackathonEvent(String name, String description,String registrationDeadline,String location, String startDate, String endDate, String status) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.registrationDeadline = registrationDeadline;
    }

    public HackathonEvent(List<Team> teams, List<Submission> submissions, List<Announcement> announcements, List<Criteria> criterias, List<Reward> rewards, List<Payment> payments,List<User> users) {
        this.teams = teams;
        this.submissions = submissions;
        this.announcements = announcements;
        this.criterias = criterias;
        this.rewards = rewards;
        this.payments = payments;
        this.users = users;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRegistrationDeadline() {
        return registrationDeadline;
    }

    public void setRegistrationDeadline(String registrationDeadline) {
        this.registrationDeadline = registrationDeadline;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public List<Submission> getSubmissions() {
        return submissions;
    }

    public void setSubmissions(List<Submission> submissions) {
        this.submissions = submissions;
    }

    public List<Announcement> getAnnouncements() {
        return announcements;
    }

    public void setAnnouncements(List<Announcement> announcements) {
        this.announcements = announcements;
    }

    public List<Criteria> getCriterias() {
        return criterias;
    }

    public void setCriterias(List<Criteria> criterias) {
        this.criterias = criterias;
    }

    public List<Reward> getRewards() {
        return rewards;
    }

    public void setRewards(List<Reward> rewards) {
        this.rewards = rewards;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HackathonEvent)) {
            return false;
        }
        HackathonEvent other = (HackathonEvent) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ac.za.tut.entities.HackathonEvent[ id=" + id + " ]";
    }
    
}
