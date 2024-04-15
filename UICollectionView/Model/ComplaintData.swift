import Foundation

struct ComplaintData {
    let imageName: String
    let title: String
    let description: String
}

// Create four objects with default data
let complaint1 = ComplaintData(imageName: "RedIcon", title: "ძალზედ საინტერესო დავალება იყო 🧐", description: "დედლაინი მაინც ნორმალური იყო თორე ჩემი 13th reason იქნებოდა ეს დავალება")
let complaint2 = ComplaintData(imageName: "BlueIcon", title: "რამე სიმღერა მირჩიეთ", description: "ON A COBWEB AFTERNOON, IN A ROOM FULL OF EMPTINESS")
let complaint3 = ComplaintData(imageName: "GreenIcon", title: "ფიგმამ თქვენც დაგტანჯათ?", description: "მე არ დავუტანჯივარ და მეთქი თქვენ როგორ ხართ თქო")
let complaint4 = ComplaintData(imageName: "YellowIcon", title: "მეტი ლანა დელ რეი გვინდა", description: "ცვეტში მისწორდება ლანა დელ რეი მარა მსოფლიო ჯერ მზად არაა ამის გასაგებად")
let complaint5 = ComplaintData(imageName: "GreenIcon", title: "გასქროლე ერთი ⬇️", description: "ჰაა ქრება დამატების Button გიჟივით? ხოა ხოდზე?")
let complaint6 = ComplaintData(imageName: "BlueIcon", title: "ალეკო ელისაშვილმა მდინარაძეს ჩაარტყა", description: "გადადით ლინკზე და გაიგეთ მეტი")

// Array to hold all the complaint data
var complaintData: [ComplaintData] = [complaint1, complaint2, complaint3, complaint4, complaint5, complaint6]
