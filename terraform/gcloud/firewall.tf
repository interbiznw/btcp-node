resource "google_compute_firewall" "btcp-terraform" {
  name    = "btcpd-terraform"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["17933, 22"]
  }
  source_tags = ["terraformnodes"]
  source_ranges = ["0.0.0.0/0"]
}
