package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TBill;
import model.TUser;
import model.T_charts;
import model.echartModel;
import model.income;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.AccountingDAO;
import business.dao.GreetLoginDAO;
import business.impl.AccountingDAOImpl;
import business.impl.GreetLoginDAOimpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/controller")
public class GreetLoginController {

	@RequestMapping(value = "/selectincome")
	public void deleteuserrolemanage(HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {

		GreetLoginDAO adao = new GreetLoginDAOimpl();
		
		HttpSession  session   =   request.getSession(); 
		TUser TUser = (model.TUser) session.getAttribute("user");

		TBill tb = new TBill();
		tb.setUserid(TUser.getUid());
		tb.setOperation("支出");

		List<T_charts> list = adao.selectincome(tb);
		/*List<T_charts> list1 = new ArrayList<>();
		list1 = list;*/

		String name = "";
		String value = null;
		ArrayList<String> listname = new ArrayList<String>();
		ArrayList<String> listvalue = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			try {
				// 转换为object
				Object obj = (Object) list.get(i);
				// 将object 转换为 object[] 即可获取对应的值了。
				Object[] objarray = (Object[]) obj;
				// 获取对应的值
				name = String.valueOf(objarray[0]);
				value = String.valueOf(objarray[1]);
				/*System.out.println("keys" + name);
				System.out.println("value" + value);*/
				listname.add(name);
				listvalue.add(value);

			} catch (Exception e) {

			}

		}

		/*System.out.println("数组listname" + listname);
		System.out.println("数组listvalue" + listvalue);*/

		
		/* String[] name = { "一月内点击量", "一周内点击量", "昨天点击量", "今天点击量" }; String[]
		  String[]data = { "233", "121", "97", "23" };*/
		 
		  Map<String, Object> map = new HashMap(); 
		  map.put("name", listname);
		  map.put("data", listvalue);

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(map));
		out.flush();
		out.close();
	}

	@RequestMapping(value = "/selectexpend")
	public void deleteuserrolemanage1(HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {

		GreetLoginDAO adao = new GreetLoginDAOimpl();

		HttpSession  session   =   request.getSession(); 
		TUser TUser = (model.TUser) session.getAttribute("user");

		TBill tb = new TBill();
		tb.setUserid(TUser.getUid());
		tb.setOperation("收入");

		ArrayList<T_charts> list = (ArrayList<T_charts>) adao.selectincome(tb);

		String name = "";
		String value = null;
		
		ArrayList<String> listname = new ArrayList<String>();
		ArrayList<String> listvalue = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			try {
				// 转换为object
				Object obj = (Object) list.get(i);
				// 将object 转换为 object[] 即可获取对应的值了。
				Object[] objarray = (Object[]) obj;
				// 获取对应的值
				name = String.valueOf(objarray[0]);
				value = String.valueOf(objarray[1]);
				/*System.out.println("keys" + name);
				System.out.println("value" + value);*/
				listname.add(name);
				listvalue.add(value);

			} catch (Exception e) {

			}

		}

		Map<String, Object> map = new HashMap();
		map.put("name", listname);
		map.put("data", listvalue);

		// List<Object>转json字符串
		/*echartModel user1 = new echartModel(1, "测试");
		echartModel user2 = new echartModel(2, "数据");
		List<echartModel> users = new ArrayList<echartModel>();
		users.add(user1);
		users.add(user2);
		String ListUserJson = JSON.toJSONString(users);*/
		/*System.out.println("List<Object>转json字符串:");*/

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(map));

		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "/selecFY")
	public void selectincome(HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {

		GreetLoginDAO adao = new GreetLoginDAOimpl();

		HttpSession  session   =   request.getSession(); 
		TUser TUser = (model.TUser) session.getAttribute("user");
		TBill tb = new TBill();
		tb.setUserid(TUser.getUid());
		tb.setOperation("收入");
		
		
		
		List num =    adao.income(tb);
		Object element =  num.get(0);
		session.setAttribute("num", element);
		
		TBill tb1 = new TBill();
		tb1.setUserid(TUser.getUid());
		tb1.setOperation("支出");
		List num1 =    adao.income(tb1);
		Object element1 =  num1.get(0);
		session.setAttribute("num1", element1);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(num));

		
		out.flush();
		out.close();
	}
	

}
