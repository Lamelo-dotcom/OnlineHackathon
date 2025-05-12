<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page contentType="application/pdf; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="ac.za.tut.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

<%
    // Retrieve data from session
    Integer numOfMentors = (Integer) session.getAttribute("numOfMentors");
    Integer numOfPerticipants = (Integer) session.getAttribute("numOfPerticipants");
    Integer numOfSponsors = (Integer) session.getAttribute("numOfSponsors");
    Integer numOfUsers = (Integer) session.getAttribute("numOfUsers");
    List<User> participants = (List<User>) session.getAttribute("participants");
    List<User> mentors = (List<User>) session.getAttribute("mentors");
    List<User> sponsors = (List<User>) session.getAttribute("sponsors");

    // Set response content type
    response.setContentType("application/pdf");

    // Set response header for PDF attachment
    response.setHeader("Content-Disposition", "attachment; filename=\"user_management_report.pdf\"");

    // Create PDF document
    Document document = new Document();
    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
    document.open();

    // Define bold font
    Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

    // Add title to the PDF
    Paragraph title = new Paragraph("User Management Report - Online Hackathon Platform", boldFont);
    title.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
    document.add(title);
    document.add(new Paragraph("\n")); // Add some space

    // Add introductory information
    Paragraph intro = new Paragraph("Admin: Sakhile Lusiba", boldFont);
    intro.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
    document.add(intro);
    document.add(new Paragraph("Date: " + new SimpleDateFormat("yyyy-MM-dd").format(new Date()), boldFont));
    document.add(new Paragraph("\n")); // Add some space

    // Add summary statistics
    document.add(new Paragraph("Summary Statistics", boldFont));
    document.add(new Paragraph("\n")); 
    document.add(new Paragraph("Total Registrations: " + (numOfUsers != null ? numOfUsers : "N/A"), boldFont));
    document.add(new Paragraph("Total Participants: " + (numOfPerticipants != null ? numOfPerticipants : "N/A"), boldFont));
    document.add(new Paragraph("Total Mentors: " + (numOfMentors != null ? numOfMentors : "N/A"), boldFont));
    document.add(new Paragraph("Total Sponsors: " + (numOfSponsors != null ? numOfSponsors : "N/A"), boldFont));
    document.add(new Paragraph("\n")); 

    // Add Participants table
    document.add(new Paragraph("Participants", boldFont));
    document.add(new Paragraph("\n")); 
    if (participants != null && !participants.isEmpty()) {
        com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(6);
        table.setWidthPercentage(100); // Set table width to 100% of page
        table.addCell(new com.itextpdf.text.Phrase("Name", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Surname", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Email", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Role", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Date of Birth", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Registration Date", boldFont));
        for (User user : participants) {
            table.addCell(new com.itextpdf.text.Phrase(user.getFirstName() != null ? user.getFirstName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getLastName() != null ? user.getLastName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getEmail() != null ? user.getEmail() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getRole() != null ? user.getRole() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getDob() != null ? user.getDob().toString() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getCreationDate() != null ? new SimpleDateFormat("yyyy-MM-dd").format(user.getCreationDate()) : "N/A", boldFont));
        }
        document.add(table);
    } else {
        document.add(new Paragraph("No participants available.", boldFont));
    }
    document.add(new Paragraph("\n")); 

    // Add Mentors table
    document.add(new Paragraph("Mentors", boldFont));
    document.add(new Paragraph("\n")); 
    if (mentors != null && !mentors.isEmpty()) {
        com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(6);
        table.setWidthPercentage(100); // Set table width to 100% of page
        table.addCell(new com.itextpdf.text.Phrase("Name", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Surname", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Email", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Role", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Date of Birth", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Registration Date", boldFont));
        for (User user : mentors) {
            table.addCell(new com.itextpdf.text.Phrase(user.getFirstName() != null ? user.getFirstName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getLastName() != null ? user.getLastName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getEmail() != null ? user.getEmail() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getRole() != null ? user.getRole() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getDob() != null ? user.getDob().toString() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getCreationDate() != null ? new SimpleDateFormat("yyyy-MM-dd").format(user.getCreationDate()) : "N/A", boldFont));
        }
        document.add(table);
    } else {
        document.add(new Paragraph("No mentors available.", boldFont));
    }
    document.add(new Paragraph("\n")); 

    // Add Sponsors table
    document.add(new Paragraph("Sponsors", boldFont));
    document.add(new Paragraph("\n")); 
    if (sponsors != null && !sponsors.isEmpty()) {
        com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(6);
        table.setWidthPercentage(100); // Set table width to 100% of page
        table.addCell(new com.itextpdf.text.Phrase("Name", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Surname", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Email", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Role", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Date of Birth", boldFont));
        table.addCell(new com.itextpdf.text.Phrase("Registration Date", boldFont));
        for (User user : sponsors) {
            table.addCell(new com.itextpdf.text.Phrase(user.getFirstName() != null ? user.getFirstName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getLastName() != null ? user.getLastName() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getEmail() != null ? user.getEmail() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getRole() != null ? user.getRole() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getDob() != null ? user.getDob().toString() : "N/A", boldFont));
            table.addCell(new com.itextpdf.text.Phrase(user.getCreationDate() != null ? new SimpleDateFormat("yyyy-MM-dd").format(user.getCreationDate()) : "N/A", boldFont));
        }
        document.add(table);
    } else {
        document.add(new Paragraph("No sponsors available.", boldFont));
    }
    document.add(new Paragraph("\n")); 

    // Add contact information
    document.add(new Paragraph("For any inquiries, please contact us at support@hackathonplatform.com", boldFont));

    // Close document
    document.close();
%>