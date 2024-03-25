# todo: use template file, so we don't have to provide template{} block for repo
resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.repo_description
  visibility         = var.repo_visibility
  is_template        = var.is_template
  archive_on_destroy = true

  template {
    owner      = var.template_owner
    repository = var.template_repo
  }

  # Features to enable
  has_discussions = true
  has_projects    = true
  has_issues      = true
  has_wiki        = true

  # Branch rules
  delete_branch_on_merge = true

  # Security
  # -------
  vulnerability_alerts = true
  # Don't call the vulnerability alerts endpoint during read, so the resource can also be used without admin permissions
  ignore_vulnerability_alerts_during_read = true
  security_and_analysis {
    # # This can only be set for private repos (but it's on by default for public repos)
    # advanced_security {
    #   # Enable advanced security features
    #   status = "enabled"
    # }
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

# For *retrieving* secret
data "aws_secretsmanager_secret_version" "github_PAT_version" {
  # todo: import secret id from central-infra workspace
  secret_id = var.secret_arn_github_PAT
}
