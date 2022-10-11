module "log_monitors" {
  source  = "app.terraform.io/torana/monitor/datadog//modules/log"
  version = "0.2.0"

}

module "log_alerts" {
  version = "0.5.0"
  source  = "app.terraform.io/torana/alert/datadog//modules/log"
}

module "pien" {
  version = "1.1.1"
  name    = "name"
  source  = "app.terraform.io/torana/ecs/aws"
}


module "pien2" {
  source = "app.terraform.io/torana/ecs/aws"

  name    = "name2"
  version = "1.5.1"
}
