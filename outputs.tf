output "dev4-ip" {
    value = "${aws_instance.dev4.public_ip}"
}

output "dev5-ip" {
    value = "${aws_instance.dev5.public_ip}"
}