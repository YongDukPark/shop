package cmunity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmunity.model.cmunityBean;
import cmunity.model.cmunityDao;
import utility.Paging;

@Controller
public class cmunityListController {
	private final String command="List.cmu";
	private final String goPage="b_cmunityCondition";
	
	@Autowired
	cmunityDao cdao;
	
	@RequestMapping(value=command)
	public ModelAndView viewList(
							@RequestParam(value="whatColumn", required=false) String whatColumn,
							@RequestParam(value="keyword", required=false) String keyword,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value="gender", required=false) String gender,
							@RequestParam(value="type", required=false) String type,
							HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		String url = request.getContextPath() + command;
		//자유게시판
		if(type.equals("all")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			int totalCount = cdao.totalCount(map);
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
			List<cmunityBean> lists = cdao.List(pageInfo, map);
			System.out.println("lists.size : " + lists.size());
			mav.addObject("lists", lists);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(goPage);
		}
		//여자게시판
		else if(type.equals("girl")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			int totalCount = cdao.totalCountGirl(map);
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
			List<cmunityBean> lists = cdao.ListGirl(pageInfo, map);
			System.out.println("lists.size : " + lists.size());
			mav.addObject("lists", lists);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(goPage);
		}
		//남자게시판
		else if(type.equals("men")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			int totalCount = cdao.totalCountMen(map);
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
			List<cmunityBean> lists = cdao.ListMen(pageInfo, map);
			System.out.println("lists.size : " + lists.size());
			mav.addObject("lists", lists);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName(goPage);
		}
		
		
		return mav;
	}
	
}
