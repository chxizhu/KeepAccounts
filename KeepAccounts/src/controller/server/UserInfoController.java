package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TBill;
import model.TUser;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.AddAccountDAO;
import business.dao.UserInfoDAO;
import business.impl.AddAccountDAOImpl;
import business.impl.UserInfoDAOImpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/userinfomodel")
public class UserInfoController {
	
	//修改用户信息
	@RequestMapping(value = "/userinfo")
	public void modificationuserinfo(	
			String username,
			int password,		
			HttpServletRequest request,
			HttpServletResponse response,
			Model model) throws IOException {
		
		UserInfoDAO udao = new UserInfoDAOImpl();
		TUser user = new TUser();
		
		HttpSession  session   =   request.getSession();    
		TUser TUser = (model.TUser) session.getAttribute("user");
		
		udao.modificationUserInfo(TUser.getUid(), username, password); //通过当前用户ID修改用户信息
		
		boolean userid = udao.modificationUserInfo(TUser.getUid(), username, password);//通过当前用户ID来判断是否修改成功
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		ReturnData td = new ReturnData();
		if (userid == true) {
			td.code = ReturnData.SUCCESS;
			td.msg = "添加成功";
		} else {
			td.code = ReturnData.ERROR;
			td.msg = "添加失败";
		}
		out.write(JSON.toJSONString(td));
		out.flush();
		out.close();
	}
	

}
