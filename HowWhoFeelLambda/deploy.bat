ECHO Compile
CALL sbt compile
ECHO Assembly
CALL sbt assembly
ECHO UPLOAD JAR
aws s3 cp E:\Working\HowWhoFeelInVideo\HowWhoFeelLambda\target\scala-2.12\FaceAnalysis-assembly-1.0.jar s3://faceattendance-cloudlabhk-com
ECHO UPDATE LAMBDA
CALL aws lambda update-function-code --function-name processImage --s3-bucket faceattendance-cloudlabhk-com --s3-key FaceAnalysis-assembly-1.0.jar --region=us-east-1
