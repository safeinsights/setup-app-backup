# SafeInsights Setup Application

## Development

Currently images from this repo need to be manually pushed by a developer. This can be done by running the following script after setting appropriate AWS credentials:

```bash
$ ./deploy/push-ecr-image.sh
```

**NOTE:** The script attempts to auto-detect the target AWS region, but you may need to either set `AWS_REGION` in your environment or update your profile configuration with a `region` value.
