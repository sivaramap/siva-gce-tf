# This is the provider used to spin up the gcloud instance
provider "google" {
  project = var.project_name
  region  = var.region_name
  zone    = var.zone_name
}

# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}
# We create a public IP address for our google compute instance to utilize
resource "google_compute_address" "static" {
  name = "vm-public-address"
}
# This creates the google instance
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = var.machine_size

  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  network_interface {
    network       = "default"
    # Associated our public IP address to this instance
  //  access_config = var.access_config
  //  address       = "${var.network_ip}"   
 //access_config = {
   // nat_ip = google_compute_address.static.address
  // }
  }
//resource "google_compute_firewall" "ssh" {
 // name    = "default"     //"${var.name}-ssh"
 // network = "${google_compute_subnetwork.default.name}"
//  allow {
  //  protocol = "tcp"
 //   ports    = ["22"]
 // }
//}
//resource "google_compute_firewall" "default" {
 // name    = "test-firewall"
 // network = google_compute_network.default.name

  //allow {
  //  protocol = "icmp"
 // }

//  allow {
//    protocol = "tcp"
//    ports    = ["80", "8080", "1000-2000"]
//  }

//  source_tags = ["web"]
//}

//resource "google_compute_network" "default" {
//  name = "test-network"
//}


//# We connect to our instance via Terraform and remotely executes our script using SSH
//  provisioner "remote-exec" {
//    script = var.script_path

//    connection {
//      type        = "ssh"
//      host        = google_compute_address.static.address
//      user        = var.username
//      private_key = file(var.private_key_path)
 //   }
 // }
}

