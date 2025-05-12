package ac.za.tut.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ProfilePicture implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String fileName;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date uploadDate;
    
    @Lob
    private byte[] imgeByte;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public ProfilePicture() {
    }

    public ProfilePicture(String fileName, Date uploadDate, byte[] imgeByte, User user) {
        this.fileName = fileName;
        this.uploadDate = uploadDate;
        this.imgeByte = imgeByte;
        this.user = user;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public byte[] getImageByte() {
        return imgeByte;
    }

    public void setImageByte(byte[] imgeByte) {
        this.imgeByte = imgeByte;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
        if (!(object instanceof ProfilePicture)) {
            return false;
        }
        ProfilePicture other = (ProfilePicture) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ac.za.tut.entities.ProfilePicture[ id=" + id + " ]";
    }
    
}
