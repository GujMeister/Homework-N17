import Foundation

struct ComplaintData {
    let imageName: String
    let title: String
    let description: String
}

// Create four objects with default data
let complaint1 = ComplaintData(imageName: "RedIcon", title: "Beka ras gverchi?", description: "ახლა გავხსენი დავალება ეს რააარიიი")
let complaint2 = ComplaintData(imageName: "BlueIcon", title: "რამე სიმღერა მირჩიეთ", description: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა")
let complaint3 = ComplaintData(imageName: "GreenIcon", title: "ფიგმამ თქვენც დაგტანჯათ?", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას")
let complaint4 = ComplaintData(imageName: "YellowIcon", title: "მეტი ბედინა გვინდა", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი")

// Array to hold all the complaint data
let complaintData: [ComplaintData] = [complaint1, complaint2, complaint3, complaint4]
