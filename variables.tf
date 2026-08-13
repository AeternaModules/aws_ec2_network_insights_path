variable "ec2_network_insights_paths" {
  description = <<EOT
Map of ec2_network_insights_paths, attributes below
Required:
    - protocol
    - source
Optional:
    - destination
    - destination_ip
    - destination_port
    - region
    - source_ip
    - tags
    - tags_all
    - filter_at_destination (block):
        - destination_address (optional)
        - destination_port_range (optional, block):
            - from_port (optional)
            - to_port (optional)
        - source_address (optional)
        - source_port_range (optional, block):
            - from_port (optional)
            - to_port (optional)
    - filter_at_source (block):
        - destination_address (optional)
        - destination_port_range (optional, block):
            - from_port (optional)
            - to_port (optional)
        - source_address (optional)
        - source_port_range (optional, block):
            - from_port (optional)
            - to_port (optional)
EOT

  type = map(object({
    protocol         = string
    source           = string
    destination      = optional(string)
    destination_ip   = optional(string)
    destination_port = optional(number)
    region           = optional(string)
    source_ip        = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    filter_at_destination = optional(object({
      destination_address = optional(string)
      destination_port_range = optional(object({
        from_port = optional(number)
        to_port   = optional(number)
      }))
      source_address = optional(string)
      source_port_range = optional(object({
        from_port = optional(number)
        to_port   = optional(number)
      }))
    }))
    filter_at_source = optional(object({
      destination_address = optional(string)
      destination_port_range = optional(object({
        from_port = optional(number)
        to_port   = optional(number)
      }))
      source_address = optional(string)
      source_port_range = optional(object({
        from_port = optional(number)
        to_port   = optional(number)
      }))
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

