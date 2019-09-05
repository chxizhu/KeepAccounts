package controller.server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/addaccountmodel")
public class AddAccountController {

	//添加用户
			@RequestMapping(value = "/addaccount")
			public void addAccount(
					String userid, //用户ID
					String billtime, //操作时间
					String money, //钱
					String category, //类别（衣服。。）
					String operation, //操作类别
					String remark, //备注						
					HttpServletRequest request,
					HttpServletResponse response,
					Model model) throws IOException {
				
				/*AdminUserDAO adao = new AdminUserDAOImpl();			
				TAdminUser user = new TAdminUser();
				
				user.setUserid(userid);
				user.setMobile(mobile);
				user.setPwd(pwd);
				user.setRoleId(roleId);
				user.setRealname(realname);
				user.setUserstatus(userstatus);
				
				//添加角色信息
				int num =adao.addAdminUser(user);
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				ReturnData td = new ReturnData();
				if (num == 0) {
					td.code = ReturnData.SUCCESS;
					td.msg = "添加成功";
				} else {
					td.code = ReturnData.ERROR;
					td.msg = "添加失败";
				}
				out.write(JSON.toJSONString(td));
				out.flush();
				out.close();*/
			}
		
			//删除用户
			/*@RequestMapping(value = "/deleteaccount")
			public void deleteaccount(
					String userid,
					HttpServletRequest request,
					HttpServletResponse response,
					Model model) throws IOException {
		
				AdminUserDAO adao = new AdminUserDAOImpl();			
		
				 boolean num= adao.deleteAdminUser(userid);
		
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				ReturnData td = new ReturnData();
				if (num == true) {
					td.code = ReturnData.SUCCESS;
					td.msg = "删除成功";
		
				} else {
					td.code = ReturnData.ERROR;
					td.msg = "删除失败，请重试";
				}
				out.write(JSON.toJSONString(td));
				out.flush();
				out.close();
			}*/
	
}
