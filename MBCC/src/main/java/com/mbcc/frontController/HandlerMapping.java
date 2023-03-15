package com.mbcc.frontController;

import java.util.HashMap;

import com.mbcc.controller.member.MemberInsertController;
import com.mbcc.controller.task.TaskController;

public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() { 
	  mappings=new HashMap<String, Controller>();
	  mappings.put("/task.do", new TaskController());
	  mappings.put("/insertmember.do", new MemberInsertController());
  }
  public Controller getController(String key) { 
	  return mappings.get(key);
  }
}
