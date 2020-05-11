data "helm_repository" "repository" {
  name = var.helm_repository
  url  = var.helm_repository_url
}

resource "helm_release" "release" {
  name      = var.name
  namespace = var.namespace
  chart     = "${var.helm_repository}/${var.chart}"
  version   = var.chart_version
  values    = [var.helm_values]
  timeout   = var.helm_timeout
}
