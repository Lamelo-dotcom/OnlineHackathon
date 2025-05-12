package ac.za.tut.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Team implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String description;
    
    @OneToOne
    @JoinColumn(name="leader_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "hackaton_id")
    private HackathonEvent hackathon;
    
    @ManyToMany
    @JoinColumn(name = "team_members")
    private List<User> users;
    
    @OneToMany(mappedBy = "team",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Submission> submissions;

    public Team() {
    }

    public Team(String name, String description, User user, HackathonEvent hackathon, List<User> users, List<Submission> submissions) {
        this.name = name;
        this.description = description;
        this.user = user;
        this.hackathon = hackathon;
        this.users = users;
        this.submissions = submissions;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public HackathonEvent getHackathon() {
        return hackathon;
    }

    public void setHackathon(HackathonEvent hackathon) {
        this.hackathon = hackathon;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Submission> getSubmissions() {
        return submissions;
    }

    public void setSubmissions(List<Submission> submissions) {
        this.submissions = submissions;
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
        if (!(object instanceof Team)) {
            return false;
        }
        Team other = (Team) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ac.za.tut.entities.Team[ id=" + id + " ]";
    }
    
}
