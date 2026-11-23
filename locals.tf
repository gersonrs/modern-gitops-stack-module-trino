locals {
  domain      = format("trino.%s", trimprefix("${var.subdomain}.${var.base_domain}", "."))
  domain_full = format("trino.%s.%s", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain)

  helm_values = [{
    trino = {
      service = {
        type = "LoadBalancer"
      }

      coordinator = {
        jvm = {
          maxHeapSize = "3G"
        }
      }
      # The Istio gateway forwards client requests with X-Forwarded-For, which
      # Trino rejects unless process-forwarded is enabled.
      additionalConfigProperties = [
        "http-server.process-forwarded=true",
      ]
      server = {
        workers = 1
        config = {
          query = {
            maxMemory             = "2GB"
            maxMemoryPerNode      = "2GB"
            maxTotalMemory        = "3GB"
            maxTotalMemoryPerNode = "2GB"
          }
        }
      }
      # Exposure is handled by the HTTPRoute below, served by the Istio
      # gateway, so the chart's own Ingress stays disabled.
      ingress = {
        enabled = false
      }

      catalogs = {
        "pinot" = <<-EOT
          connector.name=pinot
          pinot.controller-urls=${var.pinot_dns}
        EOT

        # kafka: |-
        # connector.name=kafka
        # kafka.table-names=src-app-users-json,src-app-agent-json,src-app-credit-card-json,src-app-musics-json,src-app-rides-json
        # kafka.nodes=edh-kafka-brokers.ingestion.svc.Cluster.local:9092
        # kafka.hide-internal-columns=false

        # "minio" = <<-EOT
        #   connector.name=hive-hadoop2
        #   hive.metastore=file
        #   hive.s3-file-system-type=TRINO
        #   hive.metastore.catalog.dir=s3://${var.storage.bucket_name}/
        #   hive.allow-drop-table=true
        #   hive.s3.aws-access-key=${var.storage.access_key}
        #   hive.s3.aws-secret-key=${var.storage.secret_access_key}
        #   hive.s3.endpoint=http://${var.storage.endpoint}
        #   hive.s3.path-style-access=true
        #   hive.s3.ssl.enabled=false
        #   hive.s3select-pushdown.enabled=true
        #   hive.allow-add-column=true
        #   hive.allow-drop-column=true
        #   hive.allow-drop-table=true
        #   hive.allow-rename-table=true
        #   hive.allow-rename-column=true
        #   hive.s3.multipart.min-file-size=5GB
        #   hive.s3.multipart.min-part-size=5GB
        #   hive.s3.max-connections=5000
        # EOT

        "postgres" = <<-EOT
          connector.name=postgresql
          connection-url=jdbc:postgresql://${var.database.service}:5432/${var.database.database}
          connection-user=${var.database.user}
          connection-password=${var.database.password}
        EOT
      }
    }
  }]

  helm_values_httproute = [{
    httproute = {
      enabled           = true
      host              = local.domain
      gateway_name      = var.gateway_name
      gateway_namespace = var.gateway_namespace
    }
  }]
}
