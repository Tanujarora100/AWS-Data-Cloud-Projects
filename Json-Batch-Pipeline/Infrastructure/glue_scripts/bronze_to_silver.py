from pyspark.sql import SparkSession
from pyspark.sql.functions import col, lit, trim
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Define the schema explicitly
schema = StructType([
    StructField("column1", StringType(), True),
    StructField("column2", IntegerType(), True),
    StructField("column3", StringType(), True)
])

spark = SparkSession.builder.appName('Bronze Layer Ingestion')\
    .getOrCreate()
s3_bucket_name = "data-ingestion-json-batch-pipeline"

# Use the schema for movies_raw
movies_raw = spark.read.option("header", "true")\
    .schema(schema)\
    .csv(f"s3://{s3_bucket_name}/raw/movies.csv")

tags_raw = spark.read.option("header", "true")\
    .option("inferSchema", "true").csv(f"s3://{s3_bucket_name}/raw/tags.csv")

ratings_schema = StructType([
    StructField("userId", IntegerType(), True),
    StructField("movieId", IntegerType(), True),
    StructField("rating", StringType(), True),
    StructField("timestamp", StringType(), True)
])

ratings_raw = spark.read.option("header", "true")\
    .schema(ratings_schema)\
    .csv(f"s3://{s3_bucket_name}/raw/ratings.csv")
