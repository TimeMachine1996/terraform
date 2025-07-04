# 配置阿里云Provider
provider "alicloud" {
  # 在这里配置您的认证信息
  # access_key = "您的AccessKey ID"
  # secret_key = "您的AccessKey Secret"
  region = "cn-hangzhou"  # 选择您需要的地域
}

# 创建VPC
resource "alicloud_vpc" "vpc" {
  vpc_name   = "terraform-vpc"  # VPC名称
  cidr_block = "10.0.0.0/16"    # VPC的网段
}

# 创建交换机(vSwitch)
resource "alicloud_vswitch" "vsw" {
  vswitch_name      = "terraform-vsw"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  zone_id           = "cn-hangzhou-b"  # 可用区ID
}