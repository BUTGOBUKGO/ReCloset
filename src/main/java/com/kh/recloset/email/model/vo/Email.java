package com.kh.recloset.email.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Email implements Serializable{

	private String email;
	private String key;
	
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Email(String email, String key) {
		super();
		this.email = email;
		this.key = key;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
