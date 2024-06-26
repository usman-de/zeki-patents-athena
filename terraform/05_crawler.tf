resource "aws_glue_crawler" "patents_uspto" {
  database_name = aws_glue_catalog_database.zeki_patents.name
  name          = "patents_granted_uspto"
  role          = local.arn
  description   = "AWS Glue Crawler for crawling over the patents data"
  table_prefix  = "bronze_granted_"

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
        TableLevelConfiguration = 5
      }
      CrawlerOutput = {
        Tables = { TableThreshold = 3 }
      }
      Version = 1
    }
  )

  s3_target {
    path = "s3://${local.s3_bucket_name}/loading/granted/parquet/"
  }

  schema_change_policy {
    delete_behavior = "DELETE_FROM_DATABASE"
    update_behavior = "UPDATE_IN_DATABASE"
  }

  recrawl_policy {
    recrawl_behavior = "CRAWL_EVERYTHING"
  }
}

resource "aws_glue_crawler" "patents_pre_granted_uspto" {
  database_name = aws_glue_catalog_database.zeki_patents.name
  name          = "patents_pre_granted_uspto"
  role          = local.arn
  description   = "AWS Glue Crawler for crawling over the patents data"
  table_prefix  = "bronze_pre_grant_"

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
        TableLevelConfiguration = 5
      }
      CrawlerOutput = {
        Tables = { TableThreshold = 3 }
      }
      Version = 1
    }
  )

  s3_target {
    path = "s3://${local.s3_bucket_name}/loading/pre_grant/parquet/"
  }

  schema_change_policy {
    delete_behavior = "DELETE_FROM_DATABASE"
    update_behavior = "UPDATE_IN_DATABASE"
  }

  recrawl_policy {
    recrawl_behavior = "CRAWL_EVERYTHING"
  }
}