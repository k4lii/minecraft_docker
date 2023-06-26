resource "cloudflare_record" "frontend" {
  name    = "@"
  zone_id = "1f47c626ecd2e721b6bdf7702dfcfaf8"
  value   = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  type    = "A"
  ttl     = 1
  proxied = true
}