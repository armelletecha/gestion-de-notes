module GestionDeNotes

#methode pour lire le fichier de description des etudiants

	def self.lecture_fichier(fichier)
		tableau_etudiants = Array.new
		CSV.foreach(fichier) do |ligne|
			etudiant = Etudiant.new(ligne[0],ligne[1],
                                             ligne[2])
			tableau_etudiants.push(etudiant)
		end
		return tableau_etudiants

	end

#methode pour lire le fichiers de description des travaux
	def self.lecture_fichier_cours(fichier)
		informations_cours = Array.new
		CSV.foreach(fichier) do |ligne|
			travail = Travail.new(ligne[0],ligne[1],
                                            ligne[2],ligne[3])
			informations_cours.push(travail)
		end
		return informations_cours
	end
end