package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.edu.Utils.Utility;
import com.edu.model.Voucher;
import com.edu.reponsitory.VouCherReponsitory;
import com.edu.service.UserService;

import net.bytebuddy.utility.RandomString;

@Controller
public class SendVoucherController {
    @Autowired
    private JavaMailSender mailsender;

    @Autowired
    private UserService userService;

    @Autowired
    VouCherReponsitory vouCherReponsitory;

    @GetMapping("/sendvoucher")
    public String showForgotPasswordForm(Model model) {
        Date date = java.sql.Date.valueOf(java.time.LocalDate.now());
        model.addAttribute("pageTitle", "Send Voucher Give User");
        model.addAttribute("user", userService.findAll());
        model.addAttribute("voucher", vouCherReponsitory.findall(date));
        return "voucher/sendvoucher";
    }

    @PostMapping("/sendvoucher")
    public String processForgotPassword(HttpServletRequest request, Model model)
            throws UnsupportedEncodingException, MessagingException {
        String email = request.getParameter("email");
        String voucher = request.getParameter("voucher");
        

        sendEmail(email, voucher);
       

        model.addAttribute("pageTitle", "Send Voucher");
        return "voucher/sendvoucher";
    }

    private void sendEmail(String email, String voucher)
            throws UnsupportedEncodingException, MessagingException {
        Voucher v = vouCherReponsitory.findvouchercode(voucher);
        MimeMessage message = mailsender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("haidang17522@gmail.com", "Phone Store");
        helper.setTo(email);

        String subject = "congrats on getting a voucher code";
        String content = "Hello, You have voucher code: " + voucher
                + " For product: " + v.getProduct().getName()
                + "<p>Click to buy the product now</p>" + "<p><b><a href=\"http://localhost:8080/product/list/" + v.getProduct().getId()
                + "\">Buy Now</a></b></p>";

        helper.setSubject(subject);

        helper.setText(content, true); 

        mailsender.send(message);
    }
}
