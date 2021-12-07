package org.isetn.RestControllers;

import java.util.List;

import org.isetn.entities.Formation;

import org.isetn.repository.FormationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("formation")

public class FormationController {
	@Autowired
	private FormationRepository formationRepository;

	@PostMapping("/add")
	public Formation add(@RequestBody Formation  formation) {
		return formationRepository.save(formation);
	}

	@GetMapping("/all")
	public List<Formation> getAll() {
		return formationRepository.findAll();
	}
	
	@DeleteMapping("/delete")
	public void delete(@Param("id") Long id)
	{
		Formation c =  formationRepository.findById(id).get();
		formationRepository.delete(c);
	}
	
	@PutMapping("/update")
	public Formation update(@RequestBody Formation formation) {
		return formationRepository.save(formation);
	}
}
