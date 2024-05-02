package com.ai.ojt12.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ai.ojt12.dto.Course;
import com.ai.ojt12.dto.Student;
import com.ai.ojt12.dto.StudentHasCourse;
import com.ai.ojt12.dto.User;
import com.ai.ojt12.repository.CourseRepository;
import com.ai.ojt12.repository.StudentRepository;
import com.ai.ojt12.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private CourseRepository courseRepo;
	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentRepository studentRepo;
	@Autowired
	private StudentHasCourse studentCourse;
	@RequestMapping(value = "/addstudentdisplay",method = RequestMethod.GET)
	public ModelAndView addStudentDisplay(ModelMap model) {
		List<Course>courses=courseRepo.findAll();
		model.addAttribute("courses",courses);
		return new ModelAndView("addstudent","student",new Student());	
	}
	@RequestMapping(value = "/addstudent",method=RequestMethod.POST)
	public ModelAndView addStudent(@ModelAttribute("student") Student student,@RequestParam("file") MultipartFile file,ModelMap model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) throws IOException, ServletException {
		if (file != null) {
	        String imgFileName = file.getOriginalFilename();
	     
			String uploadPath = request.getServletContext().getRealPath("resources/images/") + imgFileName;

	        try {
	            FileOutputStream fos = new FileOutputStream(uploadPath);
	            InputStream is = file.getInputStream();
	            byte[] data = new byte[is.available()];
	            is.read(data);
	            fos.write(data);
	            fos.close();
	        } catch (Exception e) {
	        	System.out.println(e.getMessage());
	        }
            student.setPhoto("resources/images/"+imgFileName); 

		}
	        
	        if(studentService.checkPhoneAlreadyExist(student.getPhone())) {
	    		List<Course>courses=courseRepo.findAll();
	    		redirectAttributes.addFlashAttribute("courses", courses);
	        	redirectAttributes.addFlashAttribute("phoneMsg","Already Register with this phone!");
	    		return new ModelAndView("redirect:/addstudentdisplay");

	        }else {
	        	User user=(User) request.getSession().getAttribute("user");
					
	            String[] attends=request.getParameterValues("attend");
	            student.setId(studentRepo.generateNextStudentId());
	            student.setUser(user);
	            studentCourse.setStudent(student);
	            studentCourse.setCourse_id(attends);
	            studentRepo.createStudent(student);
	            studentRepo.insertStudentAndCourse(studentCourse);
				redirectAttributes.addFlashAttribute("StuMsg","Student Register Success!");
				return new ModelAndView("redirect:/studentdisplay");
	        }
	}
	@RequestMapping(value = "/studentdisplay",method = RequestMethod.GET)
	public ModelAndView studentList(Model model,HttpServletRequest request) {
		List<Student>students=studentRepo.findAllStudents();
		List<Course>courses=courseRepo.findAll();
		model.addAttribute("courses", courses);
		model.addAttribute("students", students);
		ArrayList<Student> list = new ArrayList<>();

		for(Student student:students) {
			student.setPhoto(request.getServletContext().getRealPath("/") + student.getPhoto());
			list.add(student);
		}
		request.getServletContext().setAttribute("list", list);

		return new ModelAndView("student","student",new Student());
		
	}
	@RequestMapping(value = "/studentdetail",method=RequestMethod.GET)
	public ModelAndView studentDetail(@ModelAttribute Student student,Model model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		 student=studentRepo.findStudentById(student.getId());
		 String attend=student.getAttend();
		 String[]attends=attend.split(",");
		model.addAttribute(attend, attends);
		model.addAttribute("student", student);
		return new ModelAndView("studentdetail","student",student);
	}
	@RequestMapping(value = "/studentupdate",method=RequestMethod.POST)
	public ModelAndView studentUpdate(@ModelAttribute Student student,@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		if (file != null) {
	        String imgFileName = file.getOriginalFilename();
	     
			String uploadPath = request.getServletContext().getRealPath("resources/images/") + imgFileName;

	        try {
	            FileOutputStream fos = new FileOutputStream(uploadPath);
	            InputStream is = file.getInputStream();
	            byte[] data = new byte[is.available()];
	            is.read(data);
	            fos.write(data);
	            fos.close();
	        } catch (Exception e) {
	        	System.out.println(e.getMessage());
	        }
            student.setPhoto("resources/images/"+imgFileName); 

		}
		String []attend=request.getParameterValues("attend");
		studentCourse.setStudent(student);
		studentCourse.setCourse_id(attend);
		studentRepo.deleteStudentCourse(student.getId());

		studentRepo.updateStudent(student);
		studentRepo.insertStudentAndCourse(studentCourse);		
		redirectAttributes.addFlashAttribute("Update", "Updated Success!");
		return new ModelAndView("redirect:/studentdisplay");
		
	}
	@RequestMapping(value ="/studentdelete",method=RequestMethod.POST)
	public ModelAndView deleteStudent(@ModelAttribute Student student,Model model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		studentRepo.deleteStudentCourse(student.getId());
		studentRepo.deleteStudent(student.getId());
		redirectAttributes.addFlashAttribute("Delete", "Deleted Success!");
		return new ModelAndView("redirect:/studentdisplay");

	}
	@RequestMapping(value ="/searchstudent",method=RequestMethod.POST)

	public ModelAndView searchStudent(@ModelAttribute Student student,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session,RedirectAttributes redirectAttributes) {
        if(student.getId().isEmpty()&& student.getName().isEmpty() && student.getAttend().isEmpty()) {
    		return new ModelAndView("redirect:/studentdisplay");
        }
        List<Student> searchResults = studentRepo.searchStudents(student.getId(),student.getName(), student.getAttend());
        model.addAttribute("searchStudentResults", searchResults);
		return new ModelAndView("searchstudent","student",student);

	}
}
