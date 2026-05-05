resource "aws_route53_record" "www" {
  count   = 10
  zone_id = var.dns_zone_id
  name    = "${var.instances[count.index]}.${var.dns_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.testserver01[count.index].private_ip]
}