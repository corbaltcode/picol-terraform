module "database" {
  environment        = local.environment
  private_subnet_ids = module.networking.private_subnet_ids
  project            = local.project

  source = "../../modules/database"
  providers = {
    aws = aws
  }
}

module "frontend" {
  account_id  = local.account_id
  environment = local.environment
  partition   = local.partition
  project     = local.project
  region      = local.region

  source = "../../modules/frontend"
  providers = {
    aws = aws
  }
}

module "networking" {
  account_id  = local.account_id
  environment = local.environment
  partition   = local.partition
  project     = local.project
  region      = local.region

  source = "../../modules/networking"
  providers = {
    aws = aws
  }
}
