package com.uca.capas.controller;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.dao.StudentDAO;
import com.uca.capas.domain.Student;
import com.uca.capas.service.StudentService;

@Controller
public class MainController {
	
	static Logger log = Logger.getLogger(MainController.class.getName());
	
	@Autowired
	private StudentService studentService;

	@RequestMapping("/")
	public ModelAndView initMain() {
		ModelAndView mav = new ModelAndView();
		List<Student> students = null;
		try {
			students = studentService.findAll();
			log.info("Termino de buscar en la base de datos");
		} catch (Exception e) {
			log.log(Level.SEVERE,"Exception Occur",e);
		}
		mav.addObject("students", students);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView search(@RequestParam("code") Integer code) {
		ModelAndView mav = new ModelAndView();
		Student student = null;
		try {
			if (code == null) {
				mav.addObject("message", "No hay ningun estudiante registrado con ese codigo");
			} else {
				student = studentService.findOne(code);
				mav.addObject("message", "Resultado");
				mav.addObject("student", student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("studentData");
		return mav;
	}
	
	@RequestMapping("/save")
	public ModelAndView save(@ModelAttribute Student student) {
		try {
			studentService.save(student);
			log.info("Termino de guardar en la base de datos");
		} catch (Exception e) {
			log.log(Level.SEVERE, "Exception Occur", e);
		}
		return this.initMain();
	}
	
	@RequestMapping(path="/edit", method=RequestMethod.POST)
	public ModelAndView insert(@RequestParam("code") Integer code) {
		ModelAndView mav = new ModelAndView();
		Student s;
		try {
			s=studentService.findOne(code);
		} catch (Exception e) {
			s = new Student();
		}
		mav.addObject("student", new Student());
		mav.setViewName("form");
		return mav; 
	}
	
	@RequestMapping(path="/delete", method=RequestMethod.POST)
	public ModelAndView delete(@RequestParam Integer code) {
		try {
			studentService.delete(studentService.findOne(code));
		} catch (Exception e) {
			log.log(Level.SEVERE, "Exception Occur", e);
		}
		return this.initMain();
	}
	
}
