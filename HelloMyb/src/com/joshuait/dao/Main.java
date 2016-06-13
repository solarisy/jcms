package com.joshuait.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.joshuait.entity.Users;

public class Main {
	public static void main(String[] args) throws IOException, ClassNotFoundException {
		String resource = "com/joshuait/dao/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession session = sqlSessionFactory.openSession();
		try {
		  Users user = (Users) session.selectOne("org.mybatis.example.UsersMapper.selectUsers", 1);
		  System.out.println(user);
		} finally {
		  session.close();
		}
	}

}

