package org.isetn;

import org.isetn.entities.Etudiant;
import org.isetn.entities.Formation;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "p1", types = { Etudiant.class })
public interface EtudiantProjection {
	public String getNom();
	public Formation getFormation();
}
