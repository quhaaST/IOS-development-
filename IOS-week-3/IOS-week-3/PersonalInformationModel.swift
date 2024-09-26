struct PersonalInformationModel {
    
    var name: String = ""
    var education: String = ""
    
    mutating func updateData(name _name: String, education _education: String) {
        name = _name
        education = _education
    }
}
