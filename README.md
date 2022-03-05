# Nerves Package Download Site

This will terraform a nerves package download site on AWS and create IAM credentials for CircleCI. This project is meant to be used in conjuction with the [Nerves Project Build Tools](https://github.com/nerves-project/build-tools).

## Requirements

You will need:
* [asdf-vm](https://asdf-vm.com/) (or look at .tool-versions)
* an AWS account.
* AWS CLI
* Terraform

### Installing requirements

If you chose to use asdf:

```
asdf install
```

in the project directory.

Set up AWS credentials:
```
aws configure
```

AWS CLI will prompt you for your access key and secret access key.

## Terraforming the Download Site

Run the following:

```
terraform init
terraform apply
```

The terraform will output:
* `bucket_uri`
* `bucket_url`
* `circle_ci_access_key`

The `circle_ci_secret_access_key` is marked as sensitive,
So you will need to run:

```
terraform output --raw circle_ci_secret_access_key
```
