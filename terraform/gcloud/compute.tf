resource "google_compute_instance" "btcp-node" {
  project = var.project
  zone = var.region_zone
  name = var.instancename
  machine_type = var.type
  tags = ["terraformnodes"]
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size = "250"
      type = "pd-standard"
    }
  }
  metadata_startup_script = "apt-get update && apt-get -y install wget coreutils && wget https://github.com/interbiznw/btcp-node/blob/d4a32ceba37e4e7897b1c0570b33ee16e5bd4fc4/btcpd -O /home/btcpd && wget https://github.com/interbiznw/btcp-node/blob/d4a32ceba37e4e7897b1c0570b33ee16e5bd4fc4/btcp-cli -O /home/btcp-cli && chmod +x /home/btcpd && chmod +x /home/btcp-cli && mkdir /root/.bitcoinprivate && wget https://raw.githubusercontent.com/interbiznw/btcp-node/b1d0313069823fb70211574e784c034e8d77e3ed/btcprivate.conf -O /root/.bitcoinprivate && echo hi > /test.txt"
  network_interface {
    network = "default"
    access_config {
    }
  }
}

