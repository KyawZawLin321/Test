package com.ai.ojt12.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ai.ojt12.dto.User;
import com.ai.ojt12.repository.UserRepositroy;

@Controller
public class UserController {
	@Autowired
	private UserRepositroy userRepo;
	@RequestMapping(value = "/adduserdisplay",method = RequestMethod.GET)
	public ModelAndView addUser(@ModelAttribute User user,ModelMap model) {		
		return new ModelAndView("adduser","user",user);	
	}
	@RequestMapping(value = "/adduser",method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute  @Validated User user, BindingResult br,ModelMap model) {
		if (br.hasErrors()) {
			return new ModelAndView("adduser");
		} else {
			user.setId(userRepo.generateNextUserId());
			int i = userRepo.insertUser(user);
			if (i == 0) {
				model.addAttribute("error", "Add Fail!!");
				return new ModelAndView("redirect:/adduserdisplay");
			}
		return new ModelAndView("redirect:/adduserdisplay");	
	}
}
	@RequestMapping(value="/userlist",method = RequestMethod.GET)
	public ModelAndView user(@ModelAttribute User user,ModelMap model,HttpServletRequest request,HttpServletResponse response) {
		List<User>users=userRepo.findAllUser();
		model.addAttribute("users",users);
		request.getServletContext().setAttribute("list", users);
		return new ModelAndView("user","user",user);	
	}
	@RequestMapping(value = "/updateuser",method = RequestMethod.POST)
	public String updateUser(@ModelAttribute User user,ModelMap model,RedirectAttributes ra) {
		userRepo.updateUser(user);
		return "redirect:/userlist";	
	}
	@RequestMapping(value = "/deleteuser",method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute User user,ModelMap model,RedirectAttributes ra) {
		userRepo.deleteUserById(user.getId());
		return "redirect:/userlist";	
	}
	@RequestMapping(value = "/searchuser",method = RequestMethod.POST)
	public ModelAndView searchUser(@ModelAttribute User user,ModelMap model,RedirectAttributes ra) {
		List<User>searchResults=userRepo.searchUser(user.getId(), user.getName());
		model.addAttribute("searchResults",searchResults);
		return new ModelAndView("searchuser","user",user);	
	}
}