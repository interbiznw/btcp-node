resource "google_compute_instance" "btcp-node" {
  project = var.project
  zone = var.region_zone
  name = var.instancename
  machine_type = var.type
  tags = ["terraformnodes"]
  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
      size = "250"
      type = "pd-standard"
    }
  }
  metadata_startup_script = "apt-get update && apt-get -y install python-pip && pip install ansible && HOME=/root ansible-pull -o -d /opt/bitcoin-node -U https://github.com/bonovoxly/bitcoin-node /opt/bitcoin-node/ansible/bitcoin_node.yml >> /var/log/ansible-pull.log"
  network_interface {
    network = "default"
    access_config {
    }
  }
}

