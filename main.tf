terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.12.0"
    }
  }
}
provider "grafana" {
  url  = "http://localhost:3002/"
  auth = "admin:*******************************"
}

resource "grafana_data_source" "prometheus" {
  type          = "prometheus"
  name          = "Prometheus-1"
  url           = "http://prometheus-server"
  is_default    = true
  access_mode   = "proxy"
  json_data {
    time_interval = "2"
  }
}

# grafana_dashboard.kube_cluster:
# grafana_dashboard.kube_cluster:
resource "grafana_dashboard" "kube_cluster" {
    overwrite = true
    config_json = file("kube_cluster.json")
}


resource "grafana_dashboard" "ne" {
    overwrite = true
    config_json = file("ne.json")
}

