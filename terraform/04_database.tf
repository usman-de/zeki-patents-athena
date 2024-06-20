resource "aws_glue_catalog_database" "zeki_patents" {
  name        = local.database
  description = "Database for patents data of Zeki"

  tags = {
    Name        = "production"
    Environment = "Production"
  }
}
