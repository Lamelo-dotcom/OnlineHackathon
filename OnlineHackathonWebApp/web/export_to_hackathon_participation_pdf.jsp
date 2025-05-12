<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page contentType="application/pdf; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="ac.za.tut.entities.User"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

<%
    // Retrieve data from session
    List<HackathonEvent> hackathons = (List<HackathonEvent>) session.getAttribute("hackathons");

    // Set response content type
    response.setContentType("application/pdf");

    // Set response header for PDF attachment
    response.setHeader("Content-Disposition", "attachment; filename=\"hackathon_participation_report.pdf\"");

    // Create PDF document
    Document document = new Document();
    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
    document.open();

    // Define bold font
    Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

    // Add title to the PDF
    Paragraph title = new Paragraph("Hackathon Participation Report - Online Hackathon Platform", boldFont);
    title.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
    document.add(title);
    document.add(new Paragraph("\n")); // Add some space

    // Add introductory information
    Paragraph intro = new Paragraph("Admin: Sakhile Lusiba", boldFont);
    intro.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
    document.add(intro);
    document.add(new Paragraph("Date: " + new Date(), boldFont)); // Unformatted date for consistency
    document.add(new Paragraph("\n")); // Add some space

    // Add Hackathon Participation table
    document.add(new Paragraph("Hackathon Participation Details", boldFont));
    document.add(new Paragraph("\n")); 
    com.itextpdf.text.pdf.PdfPTable table = new com.itextpdf.text.pdf.PdfPTable(9);
    table.setWidthPercentage(100); // Set table width to 100% of page
    float[] columnWidths = {15f, 10f, 10f, 10f, 15f, 15f, 10f, 10f, 10f};
    table.setWidths(columnWidths);
    table.addCell(new com.itextpdf.text.Phrase("Hackathon Name", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Start Date", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("End Date", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Number of Participants", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Participant Name", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Participant Email", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Role", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Registration Date", boldFont));
    table.addCell(new com.itextpdf.text.Phrase("Activity Level", boldFont));

    if (hackathons != null && !hackathons.isEmpty()) {
        for (HackathonEvent event : hackathons) {
            List<User> users = event.getUsers();
            int participantCount = users != null ? users.size() : 0;
            if (users != null && !users.isEmpty()) {
                for (int i = 0; i < users.size(); i++) {
                    User user = users.get(i);
                    if (i == 0) {
                        table.addCell(new com.itextpdf.text.Phrase(event.getName() != null ? event.getName() : "N/A", boldFont));
                        table.addCell(new com.itextpdf.text.Phrase(event.getStartDate() != null ? event.getStartDate().toString() : "N/A", boldFont));
                        table.addCell(new com.itextpdf.text.Phrase(event.getEndDate() != null ? event.getEndDate().toString() : "N/A", boldFont));
                        table.addCell(new com.itextpdf.text.Phrase(String.valueOf(participantCount), boldFont));
                    } else {
                        table.addCell(new com.itextpdf.text.Phrase("")); // Empty cell to align with rowspan effect
                        table.addCell(new com.itextpdf.text.Phrase(""));
                        table.addCell(new com.itextpdf.text.Phrase(""));
                        table.addCell(new com.itextpdf.text.Phrase(""));
                    }
                    table.addCell(new com.itextpdf.text.Phrase(user.getFirstName() != null ? user.getFirstName() + " " + (user.getLastName() != null ? user.getLastName() : "") : "N/A", boldFont));
                    table.addCell(new com.itextpdf.text.Phrase(user.getEmail() != null ? user.getEmail() : "N/A", boldFont));
                    table.addCell(new com.itextpdf.text.Phrase(user.getRole() != null ? user.getRole() : "N/A", boldFont));
                    table.addCell(new com.itextpdf.text.Phrase(user.getCreationDate() != null ? user.getCreationDate().toString() : "N/A", boldFont));
                    table.addCell(new com.itextpdf.text.Phrase("[DYNAMIC: Activity Level]", boldFont));
                }
            } else {
                table.addCell(new com.itextpdf.text.Phrase(event.getName() != null ? event.getName() : "N/A", boldFont));
                table.addCell(new com.itextpdf.text.Phrase(event.getStartDate() != null ? event.getStartDate().toString() : "N/A", boldFont));
                table.addCell(new com.itextpdf.text.Phrase(event.getEndDate() != null ? event.getEndDate().toString() : "N/A", boldFont));
                table.addCell(new com.itextpdf.text.Phrase("0", boldFont));
                table.addCell(new com.itextpdf.text.Phrase("No participants", boldFont));
                table.addCell(new com.itextpdf.text.Phrase(""));
                table.addCell(new com.itextpdf.text.Phrase(""));
                table.addCell(new com.itextpdf.text.Phrase(""));
                table.addCell(new com.itextpdf.text.Phrase(""));
            }
        }
    } else {
        table.addCell(new com.itextpdf.text.Phrase("No hackathons available", boldFont));
        for (int i = 0; i < 8; i++) {
            table.addCell(new com.itextpdf.text.Phrase(""));
        }
    }
    document.add(table);
    document.add(new Paragraph("\n")); 

    // Add contact information
    document.add(new Paragraph("For any inquiries, please contact us at support@hackathonplatform.com", boldFont));

    // Close document
    document.close();
%>