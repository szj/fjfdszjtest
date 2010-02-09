package com.qzgf.NetStore.service;

import java.util.List;

import com.qzgf.NetStore.persistence.User;
import com.qzgf.NetStore.pub.Page;

public interface IUserService {
	public boolean checkUserId(String userid);

	// ��ΰ��08.08.27
	@SuppressWarnings("unchecked")
	public Page userList(int npage);

	@SuppressWarnings("unchecked")
	public List onlyUserList(String uId);

	public void updateUsable(String state, String id);

	// ��ΰ��08.08.27
	public boolean userRegister(User user);

	// ����userId��ø��û���Ϣ
	public User login(String userId);

}
