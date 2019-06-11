Environment Varibales Needed to run the docker:
  - AWS S3 creds
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY
    - AWS_DEFAULT_REGION
    - AWS_BUCKET_NAME

- Sample command to run manually.
```sh
AWS_ACCESS_KEY_ID="XXXXXXXXXXXXX" AWS_SECRET_ACCESS_KEY="XXXXXXXXXX+XXXXXXXX" AWS_DEFAULT_REGION="XXXXXXX" AWS_BUCKET_NAME="XXXXXXXXXX" awsFileManager.sh myfiletoCopy.zip
```


- Sample command to run `docker` manually.
```sh
docker run --rm -it -e AWS_ACCESS_KEY_ID="XXXXXXXXXXXXX" -e AWS_SECRET_ACCESS_KEY="XXXXXXXXXX+XXXXXXXX" -e AWS_DEFAULT_REGION="XXXXXXX" \
-e AWS_BUCKET_NAME="XXXXXXXXXX" --name=mongobackup macherlabs/mongotooldocker
```

Srcs
    -   https://github.com/mesosphere/aws-cli
    