package Tuan2.service.impl;

import Tuan2.dao.UserDao;
import Tuan2.dao.Impl.UserDaoImpl;
import Tuan2.model.UserModel;
import Tuan2.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.findByUserName(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}

	@Override
	public UserModel findByUserName(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public void insert(UserModel user) {
		userDao.insert(user);
	}

	@Override
	public boolean register(String email, String password, String username, String fullname, String phone) {
		if (userDao.checkExistUsername(username)) {
			return false;
		}
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);

		userDao.insert(new UserModel(0, email, username, fullname, password, null, 5, phone, date));
		return true;
	}

	@Override
	public boolean checkExistEmail(String email) {
		return userDao.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userDao.checkExistUsername(username);
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDao.checkExistPhone(phone);
	}
	
	@Override
	public UserModel findById(int id) {
	    return userDao.findById(id);
	}

	@Override
	public void updateProfile(UserModel user) {
	    userDao.updateProfile(user);
	}

}
