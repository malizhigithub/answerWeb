package cn.edu.lingnan.utils;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtil {
	
	private static String myEmailAccount = "xxxxx";
	private static String myEmailPassword = "xxxxx";
	
	private static String myEmailSMTPHost = "smtp.qq.com";
	private static String SMTP = "smtp";
	private static int port = 587;
	private static String defaultEncoding = "UTF-8";
	
	private static JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
	private static Properties prop = new Properties();
	
//	验证邮箱
//	 String html = "<html><head>"
//			+ "<a href='http://localhost:8080/AnswerWeb/"+ id + "/validatorMail' >点击验证邮箱</a>"
//			+ "</head></html>";
	
//	修改验证邮箱
	
	static {
		senderImpl.setHost(myEmailSMTPHost);
		senderImpl.setProtocol(SMTP);
		senderImpl.setUsername(myEmailAccount);
		senderImpl.setPassword(myEmailPassword);
		senderImpl.setPort(port);
		senderImpl.setDefaultEncoding(defaultEncoding);
		
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.timeout", 25000);
		prop.put("mail.debug", true);
		
		senderImpl.setJavaMailProperties(prop);
	}
	
	public static boolean sendFindPasswordMail(String to,String content) {
		boolean flag = true;
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(to);
		mailMessage.setFrom(myEmailAccount);
		mailMessage.setSubject("找回密码");
		mailMessage.setText("您的密码是：" + content);
		try {
		senderImpl.send(mailMessage);
		} catch(MailException e) {
			flag = false;
		}
		return flag;
	}
	
	public static boolean sendValidatorMail(String to,String html) {
		boolean flag = true;
		MimeMessage mailMessage = senderImpl.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage);
		try {
		messageHelper.setTo(to);
		messageHelper.setFrom(myEmailAccount);
		messageHelper.setSubject("邮箱验证");
		messageHelper.setText(html, true);
		senderImpl.send(mailMessage);
		} catch(Exception e) {
			flag = false;
		}
		return flag;
	}
	
}
