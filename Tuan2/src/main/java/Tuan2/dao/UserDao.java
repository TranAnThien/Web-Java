package Tuan2.dao;

import Tuan2.model.UserModel;

public interface UserDao {
	UserModel findByUsername(String username);
	
	void insert(UserModel user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
}
