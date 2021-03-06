module LectureEcriture
  require 'csv'

  #Convertir un string en hash
  def self.convert_to_hash(var_string)
    tableau = Array.new
    tableau = var_string.split("\"")
    tableau = tableau.join
    tableau = tableau.split("{")
    tableau = tableau[1].split("}")
    tableau = tableau[0].split(",")
    tableau.shift if tableau[0] == "=>nil"
    tableau = tableau.join
    var_hash = Hash[tableau.split(" ").map{|str| str.split("=>")}]
    return var_hash
  end

  #Lecture du fichier description de cours 
  def self.lecture_fichier(fichier)
    first = true
    tableau_etudiants = Array.new
    CSV.foreach(fichier) do |ligne|
      if first then
        first = false
      else
        ligne[3] = "{} " if ligne[3] == "{}"
        inconnu = convert_to_hash(ligne[3])
        etudiant = Etudiant.new(ligne[0],
                                ligne[1],
                                ligne[2],
                                inconnu,
                                ligne[4],
                                ligne[5])

        tableau_etudiants.push(etudiant)
      end   
    end
    return tableau_etudiants
  end

  #Lecture du fichier description des travaux
  def self.lecture_fichier_cours(fichier)
    informations_cours = Array.new
    csv_contents = CSV.read(fichier)
    csv_contents.shift
    csv_contents.shift
    csv_contents.shift
    csv_contents.shift
    csv_contents.shift
    csv_contents.shift
    csv_contents.shift

    csv_contents.each do |ligne|
      travail = Travail.new(ligne[0],
                            ligne[1],
                            ligne[2],
                            ligne[3])
      informations_cours.push(travail)

    end
    return informations_cours
  end
  
end