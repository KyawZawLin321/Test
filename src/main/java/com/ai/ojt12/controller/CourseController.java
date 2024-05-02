package com.ai.ojt12.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ai.ojt12.dto.Course;
import com.ai.ojt12.repository.CourseRepository;

@Controller
public class CourseController {
	@Autowired
	private CourseRepository courseRepo;
	@RequestMapping(value = "/coursedisplay",method = RequestMethod.GET)
	public ModelAndView course(ModelMap model) {
		return new ModelAndView("addcourse","course",new Course());
	}
	@RequestMapping(value = "/addcourse",method = RequestMethod.POST)
	public String addCourse(@ModelAttribute Course course,ModelMap model,RedirectAttributes redirectAttributes) {
		course.setId(courseRepo.generateNextUserId());
		courseRepo.createCourse(course);
		redirectAttributes.addFlashAttribute("msgC", "Register success!!");

		return "redirect:/coursedisplay";
		
	}
}
