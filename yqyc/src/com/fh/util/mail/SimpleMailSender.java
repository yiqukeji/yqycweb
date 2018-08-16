package com.fh.util.mail;

import java.util.Date;    

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;    

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import com.fh.controller.base.BaseController;

/**   
 * 邮件发送器   
 * @author 
 */    
public class SimpleMailSender extends BaseController {  
	private String from = "JFaith2018@163.com"; // 发件人邮箱地址
	private String user = "JFaith2018@163.com"; // 发件人称号，同邮箱地址
	private String password = "JFaith2018"; // 发件人邮箱客户端授权码
/**   
  * 以文本格式发送邮件   
  * @param mailInfo 待发送的邮件的信息   
  */    
    public boolean sendMail(MailSenderInfo mailInfo) throws Exception{    
    	Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.163.com"); // 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
		props.put("mail.smtp.host", "smtp.163.com"); // 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
		props.put("mail.smtp.auth", "true"); // 用刚刚设置好的props对象构建一个session
		Session session = Session.getDefaultInstance(props); // 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
		session.setDebug(true); // 用session为参数定义消息对象
		MimeMessage message = new MimeMessage(session); // 加载发件人地址
		try {
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getToAddress())); // 加载收件人地址
			message.setSubject(mailInfo.getSubject()); // 加载标题
			Multipart multipart = new MimeMultipart(); // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
			BodyPart contentPart = new MimeBodyPart(); // 设置邮件的文本内容
			contentPart.setContent( mailInfo.getContent(), "text/html;charset=utf-8");
			multipart.addBodyPart(contentPart);
			message.setContent(multipart);
			message.saveChanges(); // 保存变化
			Transport transport = session.getTransport("smtp"); // 连接服务器的邮箱
			transport.connect("smtp.163.com", user, password); // 把邮件发送出去
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
      logBefore(logger, "发送成功！");
      return true;    
    }    
       
    /**   
      * 以HTML格式发送邮件   
      * @param mailInfo 待发送的邮件信息   
      */    
    public  boolean sendHtmlMail(MailSenderInfo mailInfo) throws Exception{    
      // 判断是否需要身份认证    
      MyAuthenticator authenticator = null;   
      Properties pro = mailInfo.getProperties();   
      //如果需要身份认证，则创建一个密码验证器     
      if (mailInfo.isValidate()) {    
        authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());   
      }    
      // 根据邮件会话属性和密码验证器构造一个发送邮件的session    
      Session sendMailSession = Session.getDefaultInstance(pro,authenticator);    
      // 根据session创建一个邮件消息    
      Message mailMessage = new MimeMessage(sendMailSession);    
      // 创建邮件发送者地址    
      Address from = new InternetAddress(mailInfo.getFromAddress());    
      // 设置邮件消息的发送者    
      mailMessage.setFrom(from);    
      // 创建邮件的接收者地址，并设置到邮件消息中    
      Address to = new InternetAddress(mailInfo.getToAddress());    
      // Message.RecipientType.TO属性表示接收者的类型为TO    
      mailMessage.setRecipient(Message.RecipientType.TO,to);    
      // 设置邮件消息的主题    
      mailMessage.setSubject(mailInfo.getSubject());    
      // 设置邮件消息发送的时间    
      mailMessage.setSentDate(new Date());    
      // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象    
      Multipart mainPart = new MimeMultipart();    
      // 创建一个包含HTML内容的MimeBodyPart    
      BodyPart html = new MimeBodyPart();    
      // 设置HTML内容    
      html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");    
      mainPart.addBodyPart(html);    
      // 将MiniMultipart对象设置为邮件内容    
      mailMessage.setContent(mainPart);    
      // 发送邮件    
      Transport.send(mailMessage);    
      return true;    
    }    
 
    /*
     * @title:标题
     * @content:内容
     * @type:类型,1:文本格式;2:html格式
     * @tomail:接收的邮箱
     */
    public boolean sendMail(String title,String content,String type,String tomail) throws Exception{   
        
    	//这个类主要是设置邮件   
	     MailSenderInfo mailInfo = new MailSenderInfo();    
	     mailInfo.setMailServerHost("smtp.qq.com");    
	     mailInfo.setMailServerPort("25");    
	     mailInfo.setValidate(true);    
	     mailInfo.setUserName("itfather@1b23.com");    
	     mailInfo.setPassword("tttt");//您的邮箱密码    
	     mailInfo.setFromAddress("itfather@1b23.com");    
	     mailInfo.setToAddress(tomail);    
	     mailInfo.setSubject(title);    
	     mailInfo.setContent(content);    
	     //这个类主要来发送邮件   
	     SimpleMailSender sms = new SimpleMailSender();   
	     return sms.sendMail(mailInfo);//发送文体格式    
    	

	   }
    /**
     * @param SMTP  	邮件服务器
     * @param PORT		端口
     * @param EMAIL		本邮箱账号
     * @param PAW		本邮箱密码
     * @param toEMAIL	对方箱账号
     * @param TITLE		标题
     * @param CONTENT	内容
     * @param TYPE		1：文本格式;2：HTML格式
     */
    public static void sendEmail(String SMTP, String PORT, String EMAIL, String PAW, String toEMAIL, String TITLE, String CONTENT, String TYPE) throws Exception{ 
        //这个类主要是设置邮件   
	     MailSenderInfo mailInfo = new MailSenderInfo();
	     mailInfo.setMailServerHost(SMTP);    
	     mailInfo.setMailServerPort(PORT);    
	     mailInfo.setValidate(true);    
	     mailInfo.setUserName(EMAIL);    
	     mailInfo.setPassword(PAW);   
	     mailInfo.setFromAddress(EMAIL);    
	     mailInfo.setToAddress(toEMAIL);    
	     mailInfo.setSubject(TITLE);    
	     mailInfo.setContent(CONTENT);    
	     //这个类主要来发送邮件   
	     SimpleMailSender sms = new SimpleMailSender();
	     sms.sendMail(mailInfo);
	     
	   }
    
    public static void main(String[] args){   
        //这个类主要是设置邮件   
	     MailSenderInfo mailInfo = new MailSenderInfo();    
	     mailInfo.setMailServerHost("smtp.qq.com");    
	     mailInfo.setMailServerPort("25");    
	     mailInfo.setValidate(true);    
	     mailInfo.setUserName("itfather@1b23.com");    
	     mailInfo.setPassword("tttt");//您的邮箱密码    
	     mailInfo.setFromAddress("itfather@1b23.com");    
	     mailInfo.setToAddress("313596790@qq.com");    
	     mailInfo.setSubject("设置邮箱标题");    
	     mailInfo.setContent("设置邮箱内容");    
	     //这个类主要来发送邮件   
	     //SimpleMailSender sms = new SimpleMailSender();   
	     //sms.sendTextMail(mailInfo);//发送文体格式    
	     //sms.sendHtmlMail(mailInfo);//发送html格式   
	   }
    
}   
