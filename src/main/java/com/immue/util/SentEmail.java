package com.immue.util;

import java.io.File;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.security.Security;

public class SentEmail {

    private static final String ALIDM_SMTP_HOST = "smtp.aliyun.com";
    private static final int ALIDM_SMTP_PORT = 25;
    private static String ccEmail = "lijun.quan@aliyun.com";
    //private static String immuCCWeb = "http://localhost:8080/immune";
    //private static String immuCCWeb = "http://192.168.1.235:3200/immune";
    private static String immuCCWeb = "http://wap-lab.org:3200/immune";

    public static void confirmationEmail(String sentToEmail, String method, String pId, String jobName) throws MessagingException {
        String resultIp = immuCCWeb + "/result?jobName="+jobName+"&pId="+pId+"&method="+method;
        String  subject = "Confirmation of ImmuCC job ("+jobName+")";
        String content = "<p> Dear User:</p><br>" +
                "<p> This email is to confirm that your job ("+jobName+") has been successfully submitted to the ImmuCC server. </p> " +
                "<p>The job id assigned to this submission is " + pId +
                ".</p><p>The results will be available at: "+ resultIp +" .</p>"+
                "<p>You will receive another email notification when the job is finished.</p>"+ "<br>"+
                "<p>Thanks for using the ImmuCC server.</p><br><p>--</p>"+
                "<p>Aiping Wu Lab</p> <p>Suzhou Institute of Symtems Medicine</p>"+
                "<p>Center of Systems Medicine</p> <p>Chinese Academy of Medical Sciences</p>"+
                "<p>"+immuCCWeb+"</p>";
        sentEmail(sentToEmail, subject, content);
    }

    public static void resultEmail(String sentToEmail, String method, String pId, String jobName) throws MessagingException {
        String resultIp = immuCCWeb + "/result?jobName="+jobName+"&pId="+pId+"&method="+method;
        String  subject = "Results for your ImmuCC job ("+jobName+")";
        String content = "<p> Dear User:</p><br>" +
                "<p> Your ImmuCC job ("+ jobName +") has been finished.</p> " +
                "<p>The results are available at: </p><p>"+ resultIp +" .</p>"+
                "<p>The results will be kept on the server for one month.</p>"+ "<br>"+
                "<p>Thanks for using the ImmuCC server.</p><br><p>--</p>"+
                "<p>Aiping Wu Lab</p> <p>Suzhou Institute of Symtems Medicine</p>"+
                "<p>Center of Systems Medicine</p> <p>Chinese Academy of Medical Sciences</p>"+
                "<p>"+immuCCWeb+"</p>";
        sentEmail(sentToEmail, subject, content);
    }

    public static void sentEmail (String sentToEmail,String subject, String content) throws AddressException, MessagingException {

        final Properties props = new Properties();
        /*
         * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
         * mail.user / mail.from
         */
        // 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", ALIDM_SMTP_HOST);
        props.put("mail.smtp.port", ALIDM_SMTP_PORT);

        // 发件人的账号
        props.put("mail.user", "aipingwulab@aliyun.com");
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", "WuLabISM666.");

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress from = new InternetAddress(props.getProperty("mail.user"));
        message.setFrom(from);

        // 设置收件人
        InternetAddress to = new InternetAddress(sentToEmail);
        message.setRecipient(RecipientType.TO, to);

        //    To: 增加收件人（可选）
        //message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress("dd@receive.com", "USER_DD", "UTF-8"));
        //    Cc: 抄送（可选）
        //message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress("ee@receive.com", "USER_EE", "UTF-8"));
        //    Bcc: 密送（可选）
        //message.setRecipient(MimeMessage.RecipientType.BCC, new InternetAddress("ff@receive.com", "USER_FF", "UTF-8"));

        // 设置抄送
        //InternetAddress cc = new InternetAddress(ccEmail);
        //message.setRecipient(RecipientType.CC, cc);

        // 设置密送，其他的收件人不能看到密送的邮件地址
        //InternetAddress bcc = new InternetAddress(ccEmail);
        //message.setRecipient(RecipientType.BCC, bcc);

        // 设置邮件标题
        message.setSubject(subject);

        // 设置邮件的内容体
        message.setContent(content, "text/html;charset=UTF-8");

        // 6. 设置显示的发件时间
        message.setSentDate(new Date());
        // 发送邮件
        Transport.send(message);
    }
}
