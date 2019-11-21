
import UIKit
import Foundation

class fieldSurveyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var fieldsurveryTableView: UITableView!

    
    let jsonFileName = "observations"
    struct ObservationSet: Codable {
        var status: String
        var observations: [ObservationItem]
        
        enum CodingKeys: String, CodingKey {
            case status
            case observations
        }
    }
    struct ObservationItem: Codable {
        var classification: String
        var title: String
        var description: String
        var date: Date
        
        enum CodingKeys: String, CodingKey {
            case classification
            case title
            case description
            case date
        }
    }
    
    var Observations = [ObservationItem]()
    
    class ObservationSetLoader {
        class func load(jsonFileName: String) -> ObservationSet? {
            var observationSet: ObservationSet?
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
                let jsonData = try? Data(contentsOf: jsonFileUrl) {
                observationSet = try? jsonDecoder.decode(ObservationSet.self, from: jsonData)
            }
            return observationSet
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Field Survey"
    if let observationSet = ObservationSetLoader.load(jsonFileName: jsonFileName) {
    for observation in observationSet.observations {
        let newObservation = ObservationItem(classification: observation.classification, title: observation.title, description: observation.description, date: observation.date)
        Observations.append(newObservation)
    }
    }
            }

    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return Observations.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath) as! observationTableViewCell
           
            cell.titleLabel.text = Observations[indexPath.row].title
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Observations[indexPath.row].date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "MMM dd, yyyy 'at' HH:mm:ss a"
        let myDate = formatter.string(from: yourDate!)
        cell.dateLabel.text = myDate
        
        cell.iconImageView?.image = UIImage(named: Observations[indexPath.row].classification)
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.cellForRow(at: indexPath)?.isSelected = false
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? observationsViewController,
            let row = fieldsurveryTableView.indexPathForSelectedRow?.row {
            destination.name = Observations[row].title
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let myString = formatter.string(from: Observations[row].date)
            let yourDate = formatter.date(from: myString)
            formatter.dateFormat = "MMM dd, yyyy 'at' HH:mm:ss a"
            let myDate = formatter.string(from: yourDate!)
            destination.time = myDate
            destination.observations = Observations[row].description
            destination.icon = Observations[row].classification
        }
    }
    
        }


    

   
