package com.mbcc.frontController;

import java.util.HashMap;

import com.mbcc.controller.member.LoginCheckController;
import com.mbcc.controller.member.MainController;
import com.mbcc.controller.member.MemberInsertController;
import com.mbcc.controller.member.ValidateIdController;
import com.mbcc.controller.member.AddMemberController;
import com.mbcc.controller.member.AddressListController;
import com.mbcc.controller.member.LogOutController;
import com.mbcc.controller.task.BoardTaskController;

public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() { 
	  mappings=new HashMap<String, Controller>();
	  mappings.put("/task.do", new BoardTaskController());
	  //mappings.put("/insertmember.do", new MemberInsertController());
	  mappings.put("/loginCheck.do", new LoginCheckController());
	  mappings.put("/Address.do", new AddressListController());
	  mappings.put("/logout.do", new LogOutController());
	  mappings.put("/mk/addMember.do", new MemberInsertController());
	  mappings.put("/addMember.do", new AddMemberController());
	  mappings.put("/validateId.do", new ValidateIdController());
  }
  public Controller getController(String key) { 
	  return mappings.get(key);
  }
}
