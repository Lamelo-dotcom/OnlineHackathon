package ac.za.tut.servlets;

import ac.za.tut.entities.User;
import ac.za.tut.entities.ProfilePicture;
import ac.za.tut.sb.ProfilePictureFacadeLocal;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class SaveProfileServlet extends HttpServlet {
   
    @EJB
    private ProfilePictureFacadeLocal ppFl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("User");
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");
        Date uploadDate = new Date();
        
        Part picturePart = request.getPart("profilePicture");
        String filename = picturePart.getSubmittedFileName();
        
        byte[] picture = getProfilePictureBytes(picturePart);
        
        ProfilePicture profilePicture = setUserProfilePic(uploadDate,filename,picture);
        
        ppFl.create(profilePicture);
        
        session.setAttribute("profilePicture", profilePicture);
        if(user != null){
            
            profilePicture.setUser(user);
            
             List<ProfilePicture> pictures = user.getProfilePictures();
             pictures.add(profilePicture);
             
             session.setAttribute("pictures", pictures);
             
             user.setFirstName(firstName);
             user.setEmail(email);
             user.setLastName(lastName);
             user.setBio(bio);
             user.setProfilePictures(pictures);
        }
        
        response.sendRedirect("ViewProfileServlet.do");
        
        
    }

    private byte[] getProfilePictureBytes(Part picturePart) {
       
         byte[] picture = null;
            
        try {
            
            InputStream pictureInputStream = picturePart.getInputStream();
            
            byte[] buffer = new byte[1024];
            
            ByteArrayOutputStream bios = new ByteArrayOutputStream();
            
            int readByte;
            
            while ((readByte = pictureInputStream.read(buffer)) != -1) {
                   
               bios.write(buffer, 0, readByte);
            }
           
           picture = bios.toByteArray();
            
        } catch (IOException ex) {
            Logger.getLogger(SaveProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return picture;
    }

    private ProfilePicture setUserProfilePic(Date uploadDate, String filename, byte[] picture) {
       
        ProfilePicture upp = new ProfilePicture();
       
       upp.setImageByte(picture);
       upp.setFileName(filename);
       upp.setUploadDate(uploadDate);
        
        return upp;
    }

}
