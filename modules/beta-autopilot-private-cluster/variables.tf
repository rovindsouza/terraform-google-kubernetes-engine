/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// This file was automatically generated from a template in ./autogen/main

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}

variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "description" {
  type        = string
  description = "The description of the cluster"
  default     = ""
}

variable "regional" {
  type        = bool
  description = "Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!)"
  default     = true
}

variable "region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = null
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = []
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
}

variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = ""
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  default     = "latest"
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = []
}

variable "enable_vertical_pod_autoscaling" {
  type        = bool
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it"
  default     = false
}

variable "horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable horizontal pod autoscaling addon"
  default     = true
}

variable "http_load_balancing" {
  type        = bool
  description = "Enable httpload balancer addon"
  default     = true
}

variable "datapath_provider" {
  type        = string
  description = "The desired datapath provider for this cluster. By default, `DATAPATH_PROVIDER_UNSPECIFIED` enables the IPTables-based kube-proxy implementation. `ADVANCED_DATAPATH` enables Dataplane-V2 feature."
  default     = "DATAPATH_PROVIDER_UNSPECIFIED"
}

variable "maintenance_start_time" {
  type        = string
  description = "Time window specified for daily or recurring maintenance operations in RFC3339 format"
  default     = "05:00"
}

variable "maintenance_exclusions" {
  type        = list(object({ name = string, start_time = string, end_time = string, exclusion_scope = string }))
  description = "List of maintenance exclusions. A cluster can have up to three"
  default     = []
}

variable "maintenance_end_time" {
  type        = string
  description = "Time window specified for recurring maintenance operations in RFC3339 format"
  default     = ""
}

variable "maintenance_recurrence" {
  type        = string
  description = "Frequency of the recurring maintenance window in RFC5545 format."
  default     = ""
}

variable "ip_range_pods" {
  type        = string
  description = "The _name_ of the secondary subnet ip range to use for pods"
}

variable "ip_range_services" {
  type        = string
  description = "The _name_ of the secondary subnet range to use for services"
}


variable "resource_usage_export_dataset_id" {
  type        = string
  description = "The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export."
  default     = ""
}

variable "enable_network_egress_export" {
  type        = bool
  description = "Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic."
  default     = false
}

variable "enable_resource_consumption_export" {
  type        = bool
  description = "Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export."
  default     = true
}


variable "stub_domains" {
  type        = map(list(string))
  description = "Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server"
  default     = {}
}

variable "upstream_nameservers" {
  type        = list(string)
  description = "If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf"
  default     = []
}

variable "non_masquerade_cidrs" {
  type        = list(string)
  description = "List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading."
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "ip_masq_resync_interval" {
  type        = string
  description = "The interval at which the agent attempts to sync its ConfigMap file from the disk."
  default     = "60s"
}

variable "ip_masq_link_local" {
  type        = bool
  description = "Whether to masquerade traffic to the link-local prefix (169.254.0.0/16)."
  default     = false
}

variable "configure_ip_masq" {
  type        = bool
  description = "Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server."
  default     = false
}

variable "cluster_telemetry_type" {
  type        = string
  description = "Available options include ENABLED, DISABLED, and SYSTEM_ONLY"
  default     = null
}

variable "logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  type        = string
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "create_service_account" {
  type        = bool
  description = "Defines if service account specified to run nodes should be created."
  default     = true
}

variable "grant_registry_access" {
  type        = bool
  description = "Grants created cluster-specific service account storage.objectViewer and artifactregistry.reader roles."
  default     = false
}

variable "registry_project_ids" {
  type        = list(string)
  description = "Projects holding Google Container Registries. If empty, we use the cluster project. If a service account is created and the `grant_registry_access` variable is set to `true`, the `storage.objectViewer` and `artifactregsitry.reader` roles are assigned on these projects."
  default     = []
}

variable "service_account" {
  type        = string
  description = "The service account to run nodes as if not overridden in `node_pools`. The create_service_account variable default value (true) will cause a cluster-specific service account to be created."
  default     = ""
}

variable "issue_client_certificate" {
  type        = bool
  description = "Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive!"
  default     = false
}

variable "cluster_ipv4_cidr" {
  type        = string
  default     = null
  description = "The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR."
}

variable "cluster_resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  default     = {}
}

variable "skip_provisioners" {
  type        = bool
  description = "Flag to skip all local-exec provisioners. It breaks `stub_domains` and `upstream_nameservers` variables functionality."
  default     = false
}

variable "deploy_using_private_endpoint" {
  type        = bool
  description = "(Beta) A toggle for Terraform and kubectl to connect to the master's internal IP address during deployment."
  default     = false
}

variable "enable_private_endpoint" {
  type        = bool
  description = "(Beta) Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}

variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = false
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "(Beta) The IP range in CIDR notation to use for the hosted master network"
  default     = "10.0.0.0/28"
}

variable "master_global_access_enabled" {
  type        = bool
  description = "(Beta) Whether the cluster master is accessible globally (from any region) or only within the same region as the private endpoint."

  default = true
}

variable "dns_cache" {
  type        = bool
  description = "The status of the NodeLocal DNSCache addon."
  default     = true
}

variable "authenticator_security_group" {
  type        = string
  description = "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com"
  default     = null
}

variable "identity_namespace" {
  description = "The workload pool to attach all Kubernetes service accounts to. (Default value of `enabled` automatically sets project-based pool `[project_id].svc.id.goog`)"
  type        = string
  default     = "enabled"
}

variable "release_channel" {
  type        = string
  description = "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`."
  default     = null
}

variable "add_cluster_firewall_rules" {
  type        = bool
  description = "Create additional firewall rules"
  default     = false
}

variable "add_master_webhook_firewall_rules" {
  type        = bool
  description = "Create master_webhook firewall rules for ports defined in `firewall_inbound_ports`"
  default     = false
}

variable "firewall_priority" {
  type        = number
  description = "Priority rule for firewall rules"
  default     = 1000
}

variable "firewall_inbound_ports" {
  type        = list(string)
  description = "List of TCP ports for admission/webhook controllers. Either flag `add_master_webhook_firewall_rules` or `add_cluster_firewall_rules` (also adds egress rules) must be set to `true` for inbound-ports firewall rules to be applied."
  default     = ["8443", "9443", "15017"]
}

variable "add_shadow_firewall_rules" {
  type        = bool
  description = "Create GKE shadow firewall (the same as default firewall rules with firewall logs enabled)."
  default     = false
}

variable "shadow_firewall_rules_priority" {
  type        = number
  description = "The firewall priority of GKE shadow firewall rules. The priority should be less than default firewall, which is 1000."
  default     = 999
}

variable "enable_confidential_nodes" {
  type        = bool
  description = "An optional flag to enable confidential node config."
  default     = false
}

variable "disable_default_snat" {
  type        = bool
  description = "Whether to disable the default SNAT to support the private use of public IP addresses"
  default     = false
}

variable "notification_config_topic" {
  type        = string
  description = "The desired Pub/Sub topic to which notifications will be sent by GKE. Format is projects/{project}/topics/{topic}."
  default     = ""
}

variable "enable_tpu" {
  type        = bool
  description = "Enable Cloud TPU resources in the cluster. WARNING: changing this after cluster creation is destructive!"
  default     = false
}
variable "database_encryption" {
  description = "Application-layer Secrets Encryption settings. The object format is {state = string, key_name = string}. Valid values of state are: \"ENCRYPTED\"; \"DECRYPTED\". key_name is the name of a CloudKMS key."
  type        = list(object({ state = string, key_name = string }))

  default = [{
    state    = "DECRYPTED"
    key_name = ""
  }]
}


variable "timeouts" {
  type        = map(string)
  description = "Timeout for cluster operations."
  default     = {}
  validation {
    condition     = !contains([for t in keys(var.timeouts) : contains(["create", "update", "delete"], t)], false)
    error_message = "Only create, update, delete timeouts can be specified."
  }
}

variable "monitoring_enable_managed_prometheus" {
  type        = bool
  description = "(Beta) Configuration for Managed Service for Prometheus. Whether or not the managed collection is enabled."
  default     = false
}
