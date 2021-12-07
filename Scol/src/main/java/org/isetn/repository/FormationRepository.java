package org.isetn.repository;



//import java.util.List;

//import org.isetn.entities.Etudiant;
import org.isetn.entities.Formation;
import org.springframework.data.jpa.repository.JpaRepository;
/*import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;*/

import org.springframework.stereotype.Repository;
@Repository
public interface FormationRepository extends JpaRepository<Formation, Long> {
	/*@Query("select p from Etudiant e where e.nom like :x")
	public List<Etudiant> Chercher(@Param("x")String nom);*/

}
