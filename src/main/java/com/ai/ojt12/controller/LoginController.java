package com.ai.ojt12.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ai.ojt12.dto.User;
import com.ai.ojt12.repository.UserRepositroy;
import com.ai.ojt12.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepositroy userRepo;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public ModelAndView login(Model model) {
		return new ModelAndView("login","user",new User());
		
	}
	@RequestMapping(value = "/home",method = RequestMethod.POST)
	public String home(@ModelAttribute @Validated User user,BindingResult br,Model model) {
		if(br.hasErrors()) {
			return "login";
		}else if(userService.CheckEmailAndPassword(user.getEmail(), user.getPassword())) {
				User user1=userRepo.findUserByEmail(user.getEmail());
				String date=new java.util.Date().toString();
				session.setAttribute("email",user1.getEmail());
				session.setAttribute("id", user1.getId());
				session.setAttribute("date", date);
				session.setAttribute("user", user1);
				return  "home";
			}
		return  "redirect:/";
		}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(Model model) {
		session.invalidate();
		return new ModelAndView("redirect:/");	

	}
	}

