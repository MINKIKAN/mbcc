package com.mbcc.frontController;

import java.util.HashMap;

<<<<<<< Updated upstream
import com.mbcc.controller.member.MemberInsertController;
import com.mbcc.controller.task.BoardTaskController;
=======
import com.mbcc.controller.task.TaskController;
import com.mbcc.controller.member.*;
>>>>>>> Stashed changes

public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() { 
	  mappings=new HashMap<String, Controller>();
	  mappings.put("/task.do", new BoardTaskController());
	  mappings.put("/insertmember.do", new MemberInsertController());
	  mappings.put("/loginCheck.do", new LoginCheckController());
  }
  public Controller getController(String key) { 
	  return mappings.get(key);
  }
}
