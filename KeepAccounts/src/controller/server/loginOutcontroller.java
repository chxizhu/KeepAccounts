package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import model.TUser;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;





import unit.ReturnData;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/sysadminusermanager")
public class loginOutcontroller {
	@RequestMapping(value = "/logoutsystem")
	public void getGetSystemModelList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		HttpSession  session   =   request.getSession();    
		TUser TUser = (model.TUser) session.getAttribute("user");
		request.getSession().removeAttribute("user");
		//	    注销用户，使session失效。
	   request.getSession().invalidate();
	   
		// 回传json字符串
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		ReturnData td = new ReturnData();
		if (TUser != null) {
			td.code = ReturnData.SUCCESS;
			td.msg = "退出成功";
		} else {
			td.code = ReturnData.ERROR;
			td.msg = "退出失败";
		}
		out.write(JSON.toJSONString(td));		
		out.flush();
		out.close();

	}
}
