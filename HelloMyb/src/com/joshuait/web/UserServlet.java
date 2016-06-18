package com.joshuait.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joshuait.dao.UsersDao;
import com.joshuait.entity.Users;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		String action = request.getParameter("action");

		System.out.println("action-->>" + action);
		if ("addUser".equals(action)) {
			addUser(request, response);
		} else if ("delete".equals(action)) {
			deleteUser(request, response);
		} else if ("updateSave".equals(action)) {
			updateUser(request, response);
		} else if ("search".equals(action)) {
			search(request, response);
		} else if ("toAddPage".equals(action)) {
			toAddPage(request, response);
		} else if ("toEditPage".equals(action)) {
			toEditPage(request, response);
		} else {
			toListPage(request, response);
		}

	}

	private void toEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		UsersDao userDao = new UsersDao();
		Users user = userDao.getById(Integer.parseInt(id));
		RequestDispatcher rd = request.getRequestDispatcher("user-edit.jsp");
		request.setAttribute("user", user);
		rd.forward(request, response);

		
	}

	private void toAddPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("user-add.jsp");
		rd.forward(request, response);

	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userLogin = request.getParameter("userLogin");

		UsersDao userDao = new UsersDao();
		Users user = new Users();
		if (userLogin != null && !"".equals(userLogin.trim())) {
			user.setUserLogin(userLogin);
		}
		List<Users> usersList = userDao.Search(user);

		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("userList", usersList);
		request.setAttribute("userLogin", userLogin);
		System.out.println(usersList);
		rd.forward(request, response);
	}

	// 跳转到用户查询页面
	private void toListPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao userDao = new UsersDao();
		Users user = new Users();
		List<Users> usersList = userDao.Search(user);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request.setAttribute("userList", usersList);
		rd.forward(request, response);

	}

	// 添加用户
	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 读取页面传递过来的数据
		String userLogin = request.getParameter("userLogin");
		String userPass = request.getParameter("userPass");
		String userPassConfirm = request.getParameter("userPassConfirm");
		String userEmail = request.getParameter("userEmail");

		// 保存数据到数据库
		UsersDao userDao = new UsersDao();
		Users user = new Users();
		user.setUserLogin(userLogin);
		user.setUserPass(userPass);
		user.setUserEmail(userEmail);
		user.setUserRegistered(new Date());
		Random r = new Random();
		user.setUserActivation_key(r.nextLong() + "");
		user.setUserStatus(1);

		// 保存数据
		userDao.insert(user);

		System.out.println(userLogin + "-" + userPass + "-" + userPassConfirm + "-" + userEmail);

		request.setAttribute("msg", "新增用户成功");
		toListPage(request, response);
	}

	// 更新用户信息
	private void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 读取页面传递过来的数据
		String id = request.getParameter("id");
		String userLogin = request.getParameter("userLogin");
		String userPass = request.getParameter("userPass");
		String userPassConfirm = request.getParameter("userPassConfirm");
		String userEmail = request.getParameter("userEmail");

		// 保存数据到数据库
		UsersDao userDao = new UsersDao();
		Users user = new Users();
		user.setId(Integer.parseInt(id));
		user.setUserLogin(userLogin);
		user.setUserPass(userPass);
		user.setUserEmail(userEmail);
		// 更新数据数据
		userDao.update(user);

		System.out.println(userLogin + "-" + userPass + "-" + userPassConfirm + "-" + userEmail);

		request.setAttribute("msg", "用户更新成功");
		toListPage(request, response);
	}

	// 删除用户
	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 读取页面传递过来的数据
		String id = request.getParameter("id");

		// 保存数据到数据库
		UsersDao userDao = new UsersDao();

		// 删除数据
		userDao.delete(Integer.parseInt(id));

		System.out.println(id);

		// Ctrl + Shift + o 快速导包
		// 转发到index.jsp页面
		request.setAttribute("msg", "成功");
		toListPage(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
