package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import unit.ReturnData;
import business.dao.RegisterDAO;
import business.impl.RegisterDAOImpl;
import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/Admin")
public class SigninController {
	/**
	 * 注册
	 * @author add
	 *
	 */
	@RequestMapping(value = "/add")
	public void addsaixiang(String userid,String uname,Integer pwd,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws IOException {
		
		RegisterDAO eo = new RegisterDAOImpl();
		TUser tr = new TUser();
		
		tr.setUid(userid);
		tr.setUname(uname);
		tr.setPassword(pwd);
		
		int num = eo.addTUser(tr);
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
		out.close();
	}

}
