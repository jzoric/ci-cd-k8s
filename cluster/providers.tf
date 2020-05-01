provider "google" {
  credentials = "${file("creds/jovica-gcp-944c7addc774.json")}"
  project = "jovica-gcp" 
  region = "europe-west4"
}
