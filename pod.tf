provider "kubernetes" {
  config_context_cluster   = "minikube"
}


resource "kubernetes_pod" "pod1" {
  metadata {
    name = "podweb1"
  }

  spec {
    container {
      image = "vimal13/apache-webserver-php"
      name  = "webcont1"
	    }
    }
}
