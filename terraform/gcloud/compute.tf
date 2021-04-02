resource "google_compute_instance" "btcp-node" {
  project = var.project
  zone = var.region_zone
  count = var.instance_count
  name = "${var.basename}-${count.index}"
  machine_type = var.type
  tags = ["terraformnodes"]
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size = "250"
      type = "pd-standard"
    }
  }
  metadata_startup_script = "wget https://raw.githubusercontent.com/interbiznw/btcp-node/master/terraform/gcloud/startup.sh -O /root/startup.sh && chmod +x /root/startup.sh && bash /root/startup.sh"
  network_interface {
    network = "default"
    access_config {
    }
  }
}

