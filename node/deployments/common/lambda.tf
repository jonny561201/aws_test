//create lambda
resource "aws_lambda_function" "NodeLambda" {
  function_name = "test-function-${var.deploy_env}-${var.demo_type}"
  role = aws_iam_role.NodeIAMForLambda.arn
  handler = "main.handler"
  runtime = "nodejs12.x"
  s3_bucket = aws_s3_bucket.NodeLambdaDeploy.bucket
  s3_key = "lambda_test_${var.app_version}.zip"
  environment {
    variables = {
      AWS_QUEUE = aws_sqs_queue.NodeSqsQueue.name
    }
  }

  depends_on = [aws_s3_bucket.NodeLambdaDeploy, aws_s3_bucket_object.NodeUploadProject, aws_iam_role.NodeIAMForLambda]
}