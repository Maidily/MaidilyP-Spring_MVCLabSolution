package com.greatLearning.studentManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatLearning.studentManagement.entity.Student;
import com.greatLearning.studentManagement.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	// add mapping for "/list"
	
	@RequestMapping("/list")
	public String listStudents(Model theModel) {
		
		System.out.println("Request received");
		
		// get all student details from database table
		List<Student> theStudents = studentService.findAll();

		// add data to spring model
		theModel.addAttribute("Students", theStudents);
		
		// returning the jsp page name
		return "list-Students";
	}
	
	
	// add mapping to /showFormForAdd
	
	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {

		// create model attribute to bind form data
		Student theStudent = new Student();
		
		theModel.addAttribute("Student", theStudent);

		return "Student-form";
	}
	
	
	// add mapping to /showFormForUpdate
	
	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int theId, Model theModel) {
		
		// get student based on the id
		Student theStudent = studentService.findById(theId);
		
		// set student as model attribute to pre-populate the form
		theModel.addAttribute("Student", theStudent);
		
		return "Student-form";
	}
	
	
	// add post mapping to /save
	
	@PostMapping("/save")
	public String saveStudent(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("dept") String dept, @RequestParam("country") String country) {
		
		System.out.println("Student id - " + id);		
		Student theStudent;
		
		if (id != 0) {
			// get student based on the id
			theStudent = studentService.findById(id);
			
//			theStudent.setStudentId(id);
			theStudent.setName(name);
			theStudent.setDepartment(dept);
			theStudent.setCountry(country);
		}
		else {
			theStudent = new Student(id, name, dept, country);
		}

		// save the student data 
		studentService.save(theStudent);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/student/list";

	}
	
	
	// add mapping to /delete
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int theId) {
		
		System.out.println("Student id - " + theId);		
		
		// delete student data based on id
		studentService.deleteById(theId);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/student/list";
	}

}
