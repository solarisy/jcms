package com.joshuait.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joshuait.entity.Users;

public class UsersDao {
	public static final String resource = "com/joshuait/dao/mybatis-config.xml";
	public static InputStream inputStream = null;
	public static SqlSessionFactory sqlSessionFactory = null;

	public static void init() {
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws IOException, ClassNotFoundException {
		init();
		// System.out.println(Main.getById(1));

		/*Users user = new Users();
		user.setUserLogin("abc");
		user.setUserPass("123");

		Main.insertUser(user);

		System.out.println(user);
*/
		
		Users user = new Users();
		//user.setUserLogin("admin");

		//update(user);
		
		//delete(18);
		
		Search(user);

	}

	public static Users getById(int id) {
		SqlSession session = sqlSessionFactory.openSession();
		Users user = null;
		try {
			user = (Users) session.selectOne("org.mybatis.example.UsersMapper.getById", id);
		} finally {
			session.close();
		}
		return user;
	}
	
	public static List<Users> Search(Users user) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Users> list = null;
		try {
			list = session.selectList("org.mybatis.example.UsersMapper.search", user);
		} finally {
			session.close();
		}
		return list;
	}
	
	
	

	public static void insert(Users user) {

		SqlSession session = sqlSessionFactory.openSession();
		try {

			int n = session.update("org.mybatis.example.UsersMapper.insert", user);
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.commit();
			session.close();
		}
	}

	public static void update(Users user) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int n = session.update("org.mybatis.example.UsersMapper.update",user);
		} finally {
			session.commit();
			session.close();
		}

	}
	
	public static void delete(int id) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int n = session.update("org.mybatis.example.UsersMapper.delete",id);
			System.out.println(n);
		} finally {
			session.commit();
			session.close();
		}

	}

}
