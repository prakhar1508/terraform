provider "kubernetes" {
   config_context_cluster = "minikube"
  }

resource "kubernetes_replication_controller" "myrc1" {
  metadata {
    name = "rcweb1"
   }

  spec {
    replicas = 3
    selector = {
      dc = "IN",
      env = "dev"
    }

    template {
      metadata {
        labels = {
          dc = "IN",
          env = "dev"
         
        }
        annotations = {
          "key1" = "value1"
        }
      }

      spec {
        container {
          image = "vimal13/apache-webserver-php"
          name  = "mycontainer1"
          }
         }
      }
    }
}
