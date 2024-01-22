variable "region" {
    type    = string
    default = "ap-south-2"
}

variable "vpc_cidr" {
    type    = string
    default = "10.0.0.0/16"
}

variable "env_prefix" {
    type    = string
    default = "Jenkins"
}

variable "subnet_tags" {
    type    = list(string)
    default = [ "Master", "Agent" ]
}

variable "az_zones" {
    type    = list(string)
    default = [ "ap-south-2a", "ap-south-2b" ] 
}

variable "public_routes" {
    type    = list(string)
    default = [ "webrt1", "webrt2" ]
}

variable "web_subnets" {
    type    = list(string)
    default = [ "websub1", "websub2" ]
}

variable "key_path" {
    type    = string 
    default = "~/.ssh/id_rsa.pub"
}

variable "webserver_info" {
    type                        = object({
        count                   = string
        name                    = string
        key_name                = string
        ami_id                  = string
        instance_type           = string
        public_ip_enabled       = bool        
    })
    default                     = {
        count                   = "2"
        name                    = "Master"
        key_name                = "from_tf"
        ami_id                  = "ami-04a5a6be1fa530f1c"
        instance_type           = "t3.micro"
        public_ip_enabled       = true
    }
}

# variable "db_subnets" {
#     type        = list(string)
#     default     = [ "db1", "db2" ]
# }

# variable "app_subnets" {
#     type        = list(string)
#     default     = [ "app1", "app2" ]
# }

# variable "appserver_info" {
#     type                        = object({
#         count                   = string
#         name                    = string
#         key_name                = string
#         ami_id                  = string
#         instance_type           = string
#         public_ip_enabled       = bool
#     })    
#     default                     = {
#         count                   = "2"
#         name                    = "appservers"
#         key_name                = "from_tf"
#         ami_id                  = "ami-04a5a6be1fa530f1c"
#         instance_type           = "t3.micro"
#         public_ip_enabled       = false
#     }
# }