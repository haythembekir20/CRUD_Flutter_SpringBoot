package org.isetn.RestControllers;

import java.util.List;

import org.isetn.entities.Etudiant;
import org.isetn.entities.Formation;
import org.isetn.repository.EtudiantRepository;
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
@RequestMapping("etudiant")

public class EtudiantController {
	@Autowired
	private EtudiantRepository etudiantRepository;

	@PostMapping("/add")
	public Etudiant add(@RequestBody Etudiant etudiant ) {
		
		return etudiantRepository.save(etudiant);
	}

	@GetMapping("/all")
	public List<Etudiant> getAll() {
		return etudiantRepository.findAll();
	}
	
	@DeleteMapping("/delete")
	public void delete(@Param("id") Long id)
	{
		Etudiant c =  etudiantRepository.findById(id).get();
		etudiantRepository.delete(c);
	}
	
	@PutMapping("/update")
	public Etudiant update(@RequestBody Etudiant etudiant) {
		return etudiantRepository.save(etudiant);
	}
}
