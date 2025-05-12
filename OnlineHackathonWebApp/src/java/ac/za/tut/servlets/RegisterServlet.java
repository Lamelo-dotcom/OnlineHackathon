package ac.za.tut.servlets;

import ac.za.tut.entities.User;
import ac.za.tut.sb.UserFacadeLocal;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Pattern;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumberStr = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String dob = request.getParameter("dob");
        String role = request.getParameter("role");
        String bio = "I am a passionate developer with a keen interest in AI and web development. I enjoy participating in hackathons to solve real-world problems.";
        Date creationDate = new Date();

        // Validation error message
        String errorMsg = null;

        // Validate email uniqueness
        if (userFl.findUserByEmail(email) != null) {
            errorMsg = "A user with this email already exists. Please use a different email.";
        }

        // Validate phone number
        Integer phoneNumber = null;
        try {
            phoneNumber = Integer.valueOf(phoneNumberStr);
            if (phoneNumber <= 0) {
                errorMsg = "Phone number must be a positive integer.";
            }
        } catch (NumberFormatException e) {
            errorMsg = "Phone number must be a valid integer.";
        }

        // Validate password match
        if (errorMsg == null && !password.equals(confirmPassword)) {
            errorMsg = "Passwords do not match. Please ensure the password and confirmation password are the same.";
        }

        // Validate strong password
        if (errorMsg == null && !isStrongPassword(password)) {
            errorMsg = "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character.";
        }

        // If there are errors, forward back to register.jsp with the error message
        if (errorMsg != null) {
            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher disp = request.getRequestDispatcher("register.jsp");
            disp.forward(request, response);
            return;
        }

        // Create and persist user if all validations pass
        User user = createUser(firstName, lastName, email, phoneNumber, password, dob, creationDate, role, bio);
        System.out.println("Role: " + role);
        userFl.create(user);

        // Forward to login page on successful registration
        RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
        disp.forward(request, response);
    }

    private User createUser(String firstName, String lastName, String email, Integer phoneNumber, String password, String dob, Date creationDate, String role, String bio) {
        User user = new User();
        user.setCreationDate(creationDate);
        user.setDob(dob);
        user.setEmail(email);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setFirstName(firstName);
        user.setPhoneNumber(phoneNumber);
        user.setRole(role);
        user.setBio(bio);
        return user;
    }

    private boolean isStrongPassword(String password) {
        // Password must be at least 8 characters, with at least one uppercase, lowercase, digit, and special character
        String passwordPattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return Pattern.matches(passwordPattern, password);
    }
}