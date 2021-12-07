package org.isetn.repository;

import java.util.List;

import org.isetn.entities.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.data.rest.core.annotation.RepositoryRestResource;
@RepositoryRestResource
public interface EtudiantRepository extends JpaRepository<Etudiant, Long> {
	/*@Query("select p from Etudiant e where e.nom like :x")
	public List<Etudiant> Chercher(@Param("x")String nom);*/

}
