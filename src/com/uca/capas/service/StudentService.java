package com.uca.capas.service;

import java.util.List;

import com.uca.capas.domain.Student;

public interface StudentService {
	public List<Student> findAll(); 
	
	public Student findOne(Integer code); 
	
	public void save(Student student); 
	
	public void delete(Student student); 

}
