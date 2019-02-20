<%@page import="java.util.*"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="mydbHelper.*"%>
<%@page import="net.sf.json.*"%>
<%
String USERNAME = session.getAttribute("username").toString();
String PASSWORD = session.getAttribute("password").toString();
String TYPE = session.getAttribute("type").toString();
String DATE = session.getAttribute("login_time").toString();
Database db = new Database();

String getType = request.getParameter("getType");
if(getType != null){
	HashMap<String, String> res = new HashMap<>();
	res.put("type", TYPE);
	JSONObject.fromObject(res).write(pageContext.getOut());
	return;
}

getType = request.getParameter("type2");
if(getType != null){
	String type2 = getType;
	
	if(type2.equals("letter")){
		String oper = request.getParameter("opera");
		String id = request.getParameter("id");
		ArrayList<HashMap<String, String>> res;
		
		if(oper.equals("update")){
			res  = db.select_letter(id);
			JSONObject jo = new JSONObject();
			jo.put("letter",res);
			jo.write(pageContext.getOut());
		} else if(oper.equals("delete")){
			JSONObject Ja  = db.deleteLetter(id);
			if(!Ja.getString("state").equals("succeeded")){
				Map<String,String> ma = new HashMap<String,String>();
				ma.put("state", "failed");
				JSONObject.fromObject(ma).write(pageContext.getOut());
				return;
			}
			Ja.write(pageContext.getOut());
			return;
		} else if(oper.equals("accept")){
			JSONObject Ja  = db.acceptLetter(id);
			if(!Ja.get("state").equals("succeeded")){
				Map<String,String> ma = new HashMap<String,String>();
				ma.put("state", "failed");
				JSONObject.fromObject(ma).write(pageContext.getOut());
				return;
			}
			Ja.write(pageContext.getOut());
			return;
		}
	} else if(type2.equals("message")){
		String oper = request.getParameter("opera");
		String id = request.getParameter("id");
		ArrayList<HashMap<String, String>> res;
		
		if(oper.equals("update")){
			res  = db.select_message(id);
			JSONObject jo = new JSONObject();
			jo.put("message",res);
			jo.write(pageContext.getOut());
			return;
		} else if(oper.equals("delete")){
			JSONObject Ja  = db.deleteMessage(id);
			if(!Ja.getString("state").equals("succeeded")){
				Map<String,String> ma = new HashMap<String,String>();
				ma.put("state", "failed");
				JSONObject.fromObject(ma).write(pageContext.getOut());
				return;
			}
			Ja.write(pageContext.getOut());
			return ;
		}
	} else if(type2.equals("fees")){
		String day = request.getParameter("day");
		String buildingID = request.getParameter("buildingID");
		String domID = request.getParameter("domID");
		String oper = request.getParameter("opera");
		
		if(oper.equals("delete")){
			JSONObject Ja  = db.deleteFees(day,buildingID,domID);
			if(!Ja.getString("state").equals("succeeded")){
				Map<String,String> ma = new HashMap<String,String>();
				ma.put("state", "failed");
				JSONObject.fromObject(ma).write(pageContext.getOut());
				return;
			}
			Ja.write(pageContext.getOut());
			return;
		}
	}
} else if(request.getParameter("item")!=null){
	String item = request.getParameter("item");
	
	if(item.equals("insertM")){
		String day = request.getParameter("day");
		String duration = request.getParameter("duration");
		String objects = request.getParameter("objects");
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		
		Message m = new Message();
		m.date = day;
		m.duration = duration;
		m.publicOrNot = false;
		m.objects = objects;
		m.content = content;
		m.type = type;
		m.accept = false;
		JSONObject Ja = db.insertMessage(m);
		if(!Ja.getString("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return ;
		}
		Ja.write(pageContext.getOut());
		return ;
	} else if(item.equals("insertL")){
		String receiver = request.getParameter("receiver");
		String day = request.getParameter("day");
		String letterid = request.getParameter("letterid");
		Letter l = new Letter();
		l.letterID = letterid;
		l.receiver = receiver;
		l.date = day;
		l.state = false;

		JSONObject Ja = db.insertLetter(l);
		if(!Ja.getString("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return ;
		}
		Ja.write(pageContext.getOut());
		return ;
	} else if(item.equals("insertF")){
		String day = request.getParameter("day");
		String domID = request.getParameter("domID");
		String buildingID = request.getParameter("buildingID");
		String hotWater = request.getParameter("hotWater");
		String coolWater = request.getParameter("coolWater");
		String electric = request.getParameter("electric");

		Fees f = new Fees();
		f.day = day;
		f.DomID = domID;
		f.BuildingID = buildingID;
		f.hotWater = hotWater;
		f.coolWater = coolWater;
		f.electric = electric;

		JSONObject Ja = db.insertFees(f);
		if(!Ja.getString("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return;
		}
		Ja.write(pageContext.getOut());
		return ;
	} else if(item.equals("updateM")){
		String day = request.getParameter("day");
		String duration = request.getParameter("duration");
		String objects = request.getParameter("objects");
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		String id = request.getParameter("id");

		Message m = new Message();
		m.msgID = id;
		m.date = day;
		m.duration = duration;
		m.publicOrNot = false;
		m.objects = objects;
		m.content = content;
		m.type = type;
		m.accept = false;

		JSONObject Ja = db.updateMessage(m);
		if(!Ja.getString("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return ;
		}
		Ja.write(pageContext.getOut());
		return ;
	} else if(item.equals("updateL")){
		String receiver = request.getParameter("receiver");
		String day = request.getParameter("day");
		String id = request.getParameter("id");

		Letter l = new Letter();
		l.letterID = id;
		l.receiver = receiver;
		l.date = day;
		l.state = false;

		JSONObject Ja = db.updateLetter(l);
		if(!Ja.getString("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return;
		}
		Ja.write(pageContext.getOut());
		return ;
	} else if(item.equals("updateSettings")){
		if(TYPE.equals("manager")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state","disabled");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return;
		}

		String user2 = request.getParameter("username");
		String pass2 = request.getParameter("password1");
		String pass3 = request.getParameter("password2");
		if(!pass2.equals(pass3)){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state","failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return;
		}

		String domID = request.getParameter("dom");
		String buildID = request.getParameter("building") + request.getParameter("buildingNum");

		JSONObject Ja = db.updateUser(USERNAME,user2,pass2,domID,buildID);
		if(!Ja.get("state").equals("succeeded")){
			Map<String,String> ma = new HashMap<String,String>();
			ma.put("state", "failed");
			JSONObject.fromObject(ma).write(pageContext.getOut());
			return ;
		}
		for(int i=1;i<=4;i++){
			String id = request.getParameter("member"+i+"ID");
			String name = request.getParameter("member"+i+"Name");
			String phone = request.getParameter("member"+i+"Phone");

			if(id.equals("") && name.equals("") && phone.equals("")) continue;
			Ja = db.updateMember(id,name,phone,buildID,domID);
			if(!Ja.get("state").equals("succeeded")){
				Map<String,String> ma = new HashMap<String,String>();
				ma.put("state", "failed");
				JSONObject.fromObject(ma).write(pageContext.getOut());
				response.sendRedirect("login.jsp?setting_failed");
				return;
			}

		}
		response.sendRedirect("login.jsp?setting_succeeded");
		return;
	}
	response.sendRedirect("main.jsp?type=manager");
	return;
}

if(request.getParameter("type")!=null){
	String lOrm = request.getParameter("type");
	String day = request.getParameter("date");

	if(lOrm.equals("message")){
		ArrayList<HashMap<String, String>> res = db.findByDate(lOrm,day);
		JSONObject jo = new JSONObject();
		jo.put("type",TYPE);
		jo.put("message",res);
		jo.write(pageContext.getOut());
		return;
	} else if(lOrm.equals("letter")){
		if(TYPE.equals("manager")){
			ArrayList<HashMap<String, String>> res = db.findByDate(lOrm,day);
			JSONObject jo = new JSONObject();
			
			jo.put("type",TYPE);
			jo.put("letter",res);
			jo.write(pageContext.getOut());
			return ;
		} else if(TYPE.equals("dormitory")){
			ArrayList<HashMap<String, String>> res = db.findByDateForUser(lOrm,day,USERNAME);
			JSONObject jo = new JSONObject();
			
			jo.put("type",TYPE);
			jo.put("letter",res);
			jo.write(pageContext.getOut());
			return ;
		}
	} else if(lOrm.equals("fees")){
		String domid = request.getParameter("domid");
		String buildid = request.getParameter("buildid");

		if(TYPE.equals("manager")){
			ArrayList<HashMap<String, String>> res = db.findFee(lOrm,day,domid,buildid);
			JSONObject jo = new JSONObject();
			
			jo.put("type",TYPE);
			jo.put("fees",res);
			jo.write(pageContext.getOut());
			return;
		} else if(TYPE.equals("dormitory")){
			ArrayList<HashMap<String, String>> res = db.findFeeForUser(lOrm,day,domid,buildid,USERNAME);
			JSONObject jo = new JSONObject();
			
			jo.put("type",TYPE);
			jo.put("fees",res);
			jo.write(pageContext.getOut());
			return ;
		}
	}
}
%>