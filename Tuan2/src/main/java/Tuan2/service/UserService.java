package Tuan2.service;

import Tuan2.model.UserModel;

public interface UserService {
//	Login
	UserModel login(String username, String password);
	UserModel findByUserName(String username);
	
//	Register
	void insert(UserModel user);
	boolean register(String email, String password, String username, String
	fullname, String phone);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
}
