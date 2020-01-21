	package com.kh.recloset.email.model.service;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.mail.javamail.JavaMailSender;
	import org.springframework.stereotype.Service;

	import com.kh.recloset.email.RandomNumber;
	import com.kh.recloset.email.emailHandler.EmailHandler;
	import com.kh.recloset.email.model.dao.EmailDAO;
	import com.kh.recloset.email.model.vo.Email;

	@Service
	public class EmailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	EmailDAO emailDao;
	
	@Autowired
	Email email;
	
		public int checkEmail(String Email, String userId) throws Exception {
			int result = emailDao.checkEmail(Email);
			
			if(result == 0) {
				result = createRandNum(Email, userId);
			}
			System.out.println("result : " + result);
			
			return result;
		}
	
		public int createRandNum(String Email_, String userId) throws Exception {
		
		RandomNumber randomNumber = new RandomNumber();
		
		String key = randomNumber.getKey(50, false);
		
		
		email.setEmail(Email_);
		email.setKey(key);
		
		emailDao.createRandNum(email);
		
		EmailHandler sendMail = new EmailHandler(mailSender);
		
		sendMail.setSubject("Recloset 이메일 인증");
		sendMail.setText("<h1>메일 인증</h1>" + "<h3>이메일 인증 확인</h3>"
				+ "<h3>" + key + "</h3>");
		sendMail.setFrom("limjaewon92@gmail.com", "Recloset");
		sendMail.setTo(Email_);
		sendMail.send();
		
		System.out.println("check : " + email.getEmail());
		System.out.println("check : " + email.getKey());
		
		
		return 2;
		
		}
		
		public int emailConfirm(String Email_, String key) {
			
			email.setEmail(Email_);
			email.setKey(key);
			System.out.println(email);
			return emailDao.emailConfirm(email);
		}

		public int deleteEmail(String email) {
			
			return emailDao.deleteEmail(email);
		}

		
		
		

}

