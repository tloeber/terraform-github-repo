
# Github
# ------
variable "repo_name" {
  description = "The name of the repository"
  type        = string
}
variable "repo_description" {
  description = "The description of the repository"
  type        = string
}
variable "repo_visibility" {
  description = "The visibility of the repository"
  type        = string
}

variable "is_template" {
  description = "Whether the repository is a template"
  type        = bool
}
variable "template_repo" {
  description = "The name of the template repo from which we create our repo."
  type        = string
}
variable "template_owner" {
  description = "The GitHub account who owns the template repo we use"
  type        = string
}


# AWS
# ----
variable "secret_arn_github_PAT" {
  description = "The ARN of the secret containing the GitHub Personal Access Token"
  type        = string
}
variable "aws_region" {
  description = "AWS region name"
  type        = string
  validation {
    condition = contains(
      ["ap-northeast-1", "ap-northeast-2", "ap-south-1", "ap-southeast-1", "ap-southeast-2", "ca-central-1", "eu-central-1", "eu-west-1", "eu-west-2", "eu-west-3", "sa-east-1", "us-east-1", "us-east-2", "us-west-2"],
      var.aws_region
    )
    error_message = "Invalid name for AWS region."
  }
}
