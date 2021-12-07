package org.isetn.repository;


import java.util.List;

import org.isetn.entities.Classe;
import org.isetn.entities.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;





public interface ClasseRepository extends JpaRepository<Classe, Long> {
	

}
