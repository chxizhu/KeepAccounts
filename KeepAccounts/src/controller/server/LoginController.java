package controller.server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.TUser;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.UserLoginDAO;
import business.impl.UserLoginDAImpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/Admin")
public class LoginController {
	/**
	 * 登录
	 * @author select
	 *
	 */
	@RequestMapping(value = "AdminLogin")
	public void getlogin(String userid, Integer pwd,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws IOException {
		
		UserLoginDAO ado = new UserLoginDAImpl();
		TUser user = ado.UserLogin(userid, pwd);
		// 回传json字符串
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		ReturnData td = new ReturnData();
		System.out.println(userid);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			td.code = ReturnData.SUCCESS;
			td.msg = "查询成功";
			td.data = null;
		} else {
			td.code = ReturnData.ERROR;
			td.msg = "查询失败";
		}
		out.write(JSON.toJSONString(td));
		out.flush();
		out.close();

	}
	
}
