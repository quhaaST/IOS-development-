import UIKit

class ViewController: UIViewController {
    
    private let informationView = InformationFieldView()
    private let nameTextField = InformationInputTextField()
    private let educationTextField = InformationInputTextField()
    private let saveButton = UIButton()
    
    private var data = PersonalInformationModel()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        logLifecycleChange("init()")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        logLifecycleChange("init?()")
    }
    
    override func loadView() {
        super.loadView()
        logLifecycleChange("loadView()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logLifecycleChange("viewDidLoad()")
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logLifecycleChange("viewWillAppear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logLifecycleChange("viewDidAppear()")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logLifecycleChange("viewWillDisappear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logLifecycleChange("viewDidDisappear()")
    }
    
    private func setupViews() {
        informationView.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        
        educationTextField.translatesAutoresizingMaskIntoConstraints = false
        educationTextField.placeholder = "Education"
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .lightGray
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.setTitleColor(.gray, for: .selected)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 12
        
        saveButton.addTarget(self, action: #selector(onSaveButtonClick(_:)), for: .touchUpInside)
        
        view.addSubview(informationView)
        view.addSubview(nameTextField)
        view.addSubview(educationTextField)
        view.addSubview(saveButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            informationView.heightAnchor.constraint(equalToConstant: 128),
            
            
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameTextField.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 128),
            
            educationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            educationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            educationTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            
            saveButton.heightAnchor.constraint(equalToConstant: 32),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            saveButton.topAnchor.constraint(equalTo: educationTextField.bottomAnchor, constant: 16)
        ])
    }
    
    @IBAction private func onSaveButtonClick(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let education = educationTextField.text ?? ""
        
        
        data.updateData(name: name, education: education)
        
        informationView.configure(data: data)
        nameTextField.text = ""
        educationTextField.text = ""
    }
    
    private func logLifecycleChange(_ action: String) {
        print("ViewController called \(action)")
    }
}

