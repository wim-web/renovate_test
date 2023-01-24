plugin "aws" {
  enabled = true
  version = "0.21.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

config {
  module = true
}

rule "terraform_naming_convention" {
  enabled = true
}

# TODO: modules配下にだけ適用したい
rule "terraform_required_version" {
  enabled = false
}

# TODO: modules配下にだけ適用したい
rule "terraform_required_providers" {
  enabled = false
}
